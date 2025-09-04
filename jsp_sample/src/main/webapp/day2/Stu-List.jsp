<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<style>
    #container{
        width: 700px;
        margin: 20px auto;
    }
    
    table, tr, td, th{
        border: 1px solid black;
        text-align: center;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    
    th{
     background-color : #eee;
    }
    
    #search{
    	margin-bottom : 20px;
    }
</style>
</head>
<body>

<!-- Stu-List.jsp => 학생목록을 테이블 형태로 출력
                   +(출력컬럼 - 학번,이름,학과,키)
                   + 검색 기능 추가(이름으로 검색) -->

<%@ include file="../db/db.jsp" %>
<%

    String keyword = request.getParameter("keyword");
    if(keyword == null) keyword = "";
%>

<div id="container"> 
	<div id="search">
		이름 검색 : <input type="text" id="keyword" value="<%= keyword %>">
		<button onclick="fnSearch()">검색</button>
	</div>
    <table>
        <tr>
            <th>학번</th>
            <th>이름</th>
            <th>학과</th>
            <th>키</th>
            <th>삭제</th> <%-- 추가된 부분 --%>
        </tr>
        
    <%
        ResultSet rs = null;
        String query = "SELECT STU_NO, STU_NAME, STU_DEPT, STU_HEIGHT FROM STUDENT ";
        if(!keyword.trim().equals("")){
            query += "WHERE STU_NAME LIKE '%" + keyword + "%' ";
        }
        query += "ORDER BY STU_NO";
        
        rs = stmt.executeQuery(query);
        
        while(rs.next()){
            String currentStuNo = rs.getString("STU_NO"); // 현재 학생의 학번을 변수에 저장
    %>
        <tr>
            <td><%= currentStuNo %></td>
            <td><%= rs.getString("STU_NAME") %></td>
            <td><%= rs.getString("STU_DEPT") %></td>
            <td><%= rs.getString("STU_HEIGHT") %></td>
            <td>
                <%-- 삭제 버튼 추가 및 클릭 시 fnRemove 함수 호출 --%>
                <button onclick="fnRemove('<%= currentStuNo %>')">삭제</button>
            </td>
        </tr>
    <%
        }
        if(rs != null) rs.close();
    %>
    
    </table>    
</div>

<script>
	function fnSearch(){
	    let keyword = document.querySelector("#keyword").value.trim();
	    location.href = "Stu-List.jsp?keyword=" + encodeURIComponent(keyword);
	}

    // 삭제 버튼 클릭 시 호출되는 함수
    function fnRemove(stuNo) {
        if (confirm(stuNo + " 학번 학생을 정말 삭제하시겠습니까?")) {
            location.href = "Stu-Remove.jsp?stuNo=" + stuNo;
        }
    }
</script>

</body>
</html>