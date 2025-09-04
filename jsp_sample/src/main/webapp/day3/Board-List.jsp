<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width: 700px;
		margin : 50px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding : 5px 10px;
	}
	th {
		background-color: #eee;
	}
	tr:nth-child(odd) {
		background-color: #edede3;
	}
	#search{
		margin-bottom : 20px;
	}
	a{
		text-decoration : none;
	}
	.page a{
		text-decoration: none;
		color : black;
		padding : 5px;
		text-align: center;
	}
	
	.page .active{
		font-weight: bold;
	}
</style>
</head>
<body>
<%@ include file="../db/db.jsp" %>
<div id="container">
	<div id="search">
		<a href="Board-List.jsp">전체 목록</a>&nbsp;&nbsp;
		<label for="keyword">검색어 :</label> <input type="text" id="keyword" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
			   <button onclick="fnSearch()">검색</button>
			   
	</div>
	<div id = "search">
		<label for="number">페이지 당 글 수 :</label>
		<select id = "number" onchange="fnNumber(this.value)">
			<% 
				int arr[] = {3,5,7,10,15,20};
				String currentPageSize = request.getParameter("size");
				if (currentPageSize == null) {
				    currentPageSize = "10"; // 기본값 설정
				}
				for(int i=0; i<arr.length; i++){
					String selected = currentPageSize.equals(String.valueOf(arr[i])) ? "selected" : "";
			%>
				<option value="<%= arr[i] %>" <%= selected %>><%= arr[i] %>개씩</option>
			<% 
				}
			%>
		</select>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>
			<%
			String orderKind = request.getParameter("orderKind");	
			String currentColumn = request.getParameter("column");
			String urlPrefix = "javascript:fnList('CNT'";

			// 현재 정렬 상태에 따라 링크 변경
			if ("CNT".equals(currentColumn)) {
			    if ("ASC".equals(orderKind)) {
			%>
				<a href="<%= urlPrefix %>, 'DESC')">조회수🔺</a>
			<% 
			    } else {
			%>
				<a href="<%= urlPrefix %>, 'ASC')">조회수🔻</a>
			<% 
			    }
			} else {
			%>
				<a href="<%= urlPrefix %>, 'DESC')">조회수</a>
			<%
			}
			%>
			</th>
			<th><a href="javascript:;" onclick="fnList('CDATETIME', 'DESC')">작성일</a></th>
		</tr>
	
	<%
		ResultSet rs = null;
		String keyword = request.getParameter("keyword");	
		String column = request.getParameter("column");
		String pageSizeStr = request.getParameter("size");
		String pageNumStr = request.getParameter("pageNum");

		String keywordQuery = "";
		if(keyword != null && !keyword.isEmpty()){
			keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%' ";
		}
		
		String orderQuery = "ORDER BY BOARDNO DESC";
		if(column != null && orderKind != null){
		    orderQuery = "ORDER BY " + column + " " + orderKind;
		}
		
		int pageSize = 10;
		if (pageSizeStr != null) {
		    try {
		        pageSize = Integer.parseInt(pageSizeStr);
		    } catch (NumberFormatException e) {
		    }
		}

		int currentPage = 1;
		if (pageNumStr != null) {
		    try {
		        currentPage = Integer.parseInt(pageNumStr);
		    } catch (NumberFormatException e) {
		    }
		}
		
		// 검색 조건에 맞는 전체 게시글 수를 가져옴
		String cntQuery = "SELECT COUNT(*) TOTAL FROM TBL_BOARD " + keywordQuery;
		ResultSet rsCnt = stmt.executeQuery(cntQuery);
		rsCnt.next();
		
		int total = rsCnt.getInt("TOTAL");
		int pageList = (int)Math.ceil((double) total / pageSize);
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		// Oracle ROWNUM을 사용한 페이징 쿼리
		String query = "SELECT * FROM ("
					 + " SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') CTIME, ROWNUM RN "
					 + " FROM TBL_BOARD B " + keywordQuery + orderQuery
					 + ") WHERE RN BETWEEN " + startRow + " AND " + endRow;
		
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
	%>
		 	<tr>
		 		<td> <%= rs.getString("BOARDNO") %> </td>
		 		<td> 
		 			<a href="javascript:;" onclick="fnBoard(<%= rs.getString("BOARDNO") %>)"><%= rs.getString("TITLE") %></a>
		 		</td>
		 		<td> <%= rs.getString("USERID") %> </td>
		 		<td> <%= rs.getString("CNT") %> </td>
		 		<td> <%= rs.getString("CTIME") %> </td>
		 	</tr>	
	<%		
		}
		
	%>
	
	</table>
	<div class = "page">
		<%
			for(int i=1; i<=pageList; i++){
				String activeClass = (i == currentPage) ? "active" : "";
				out.println("<a href='javascript:fnPage(" + i + ")' class='" + activeClass + "'>" + i + "</a>");
			}
		%>
	</div>
	
	<div>
		<a href = "Board-Add.jsp">
			<input type = "button" value= "글쓰기">
		</a>
	</div>
</div>
</body>
</html>
<script>
	function fnBoard(boardNo){
		location.href = "Board-View.jsp?boardNo="+boardNo;
	}
	
	// URL에서 현재 파라미터들을 가져오는 함수
	function getUrlParams() {
	    const params = new URLSearchParams(location.search);
	    let paramObj = {};
	    for (const [key, value] of params.entries()) {
	        paramObj[key] = value;
	    }
	    return paramObj;
	}

	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		let params = getUrlParams();
		if (keyword) {
		    params.keyword = keyword;
		} else {
		    delete params.keyword;
		}
		params.pageNum = 1; // 검색 시 첫 페이지로 이동
		let url = "Board-List.jsp?" + new URLSearchParams(params).toString();
		location.href = url;
	}
	
	function fnList(column, orderKind){
	    let params = getUrlParams();
	    params.column = column;
	    params.orderKind = orderKind;
	    let url = "Board-List.jsp?" + new URLSearchParams(params).toString();
	    location.href = url;
	}
	
	function fnNumber(number){
	    let params = getUrlParams();
	    params.size = number;
	    params.pageNum = 1; // 페이지당 개수 변경 시 첫 페이지로 이동
	    let url = "Board-List.jsp?" + new URLSearchParams(params).toString();
	    location.href = url;
	}
	
	// 페이지 번호를 클릭하면 실행되는 함수
	function fnPage(pageNum){
	    let params = getUrlParams();
	    params.pageNum = pageNum;
	    let url = "Board-List.jsp?" + new URLSearchParams(params).toString();
	    location.href = url;
	}
</script>
