<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board-View.jsp</title>
<style>
	#container{
		width: 700px;
		margin : 20px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding : 5px 10px;
	}
	th {
		background-color: #ccc;
		width : 100px;
	}
	td {
		width : 500px;
	}
	.contents {
		height : 300px;
	}
</style>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	
	
	<div id="container">
	<%
		ResultSet rs = null;
		String boardNo = request.getParameter("boardNo");
		String query = "SELECT * FROM TBL_BOARD "
					 + "WHERE BOARDNO = " + boardNo;
		
		rs = stmt.executeQuery(query);
		if(rs.next()){
	%>
		<form name="board" action="Board-Remove.jsp">
			<input name="boardNo" value="<%= rs.getString("BOARDNO") %>" hidden>
			<table>
				<tr>
					<th>제목</th>
					<td><%= rs.getString("TITLE") %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%= rs.getString("USERID") %></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%= rs.getString("CDATETIME") %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="contents"><%= rs.getString("CONTENTS") %></td>
				</tr>
			</table>
			<%
			 String userId = rs.getString("USERID");
			 String sessionId = (String)session.getAttribute("sessionId");
			 String status = (String) session.getAttribute("sessionStatus");
			 
			 // 로그인한 사용자가 게시글 작성자이거나, 관리자 권한(A)을 가진 경우
			 if(userId.equals(sessionId) || (status != null && status.equals("A"))){
			%>
			<div>
				<input type="button" value="삭제" onclick="fnRemove()">
				<input type="button" value="수정" onclick="fnEdit()">
			</div>
			
			<%	 
			 }
			
			%>
			
		</form>
	<%		
		} else {
			out.println("게시글 조회에 실패했습니다.");
		}
	%>
	</div>	
	
</body>
</html>
<script>
	function fnEdit(){
		let board = document.board;
		board.action = "Board-Edit.jsp"
		board.submit();
	}
	
	function fnRemove(){
		let board = document.board;
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		
		board.submit();
	}
</script>