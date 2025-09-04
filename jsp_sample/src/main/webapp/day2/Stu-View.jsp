<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 정보</title>
<style>
	#container {
		width: 700px;
		margin: 20px auto;
	}
	table, tr, td, th {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th {
		background-color: #ccc;
		width: 100px;
	}
	td {
		width: 500px;
	}
	.contents {
		height: 300px;
		text-align: left;
		vertical-align: top;
		padding: 10px;
	}
	.btn-group {
	    margin-top: 10px;
	    display: flex;
	    justify-content: flex-end;
	}
	.btn-group button, .btn-group a {
		margin-left : 10px;
	    padding: 8px 12px;
	    border: 1px solid #ccc;
	    background-color: #f7f7f7;
	    cursor: pointer;
	    text-decoration: none;
	    color: black
	}
</style>
</head>
<body>

<!-- Stu-View.jsp : 학생 목록에서 학번 클릭 시 상세 조회 + 삭제 버튼 -->

<%@ include file="../db/db.jsp" %>

<div id="container">
<%
	ResultSet rs = null;
	String stuNo = request.getParameter("stuNo");

	if(stuNo != null && !stuNo.trim().equals("")) {
		// STUDENT 테이블의 실제 컬럼에 맞춰 쿼리 수정
		String query = "SELECT STU_NO, STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS, STU_GENDER, STU_HEIGHT, STU_WEIGHT FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		
		rs = stmt.executeQuery(query);

		if(rs.next()){
%>
		<form action="Stu-Remove.jsp" method="post">
			<input type="hidden" name="stuNo" value="<%= rs.getString("STU_NO") %>">
			<table>
				<tr>
					<th>학번</th>
					<td><%= rs.getString("STU_NO") %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%= rs.getString("STU_NAME") %></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><%= rs.getString("STU_DEPT") %></td>
				</tr>
				<tr>
					<th>
					String orderHeight = request.getParameter("orderHeight");
					String currentColumn = requets.getParameter("currentColumn"); //체크포인트!
					
					
					
					
					
					키</th>
					<td><%= rs.getString("STU_HEIGHT") %></td>
				</tr>

			</table>
			<div class="btn-group">
				<a href="Stu-List.jsp">목록</a>
				<button type="submit">삭제</button>
			</div>
		</form>
<%
		} else {
			out.println("<h3>학생 정보를 찾을 수 없습니다.</h3>");
		}
	} else {
		out.println("<h3>잘못된 접근입니다.</h3>");
	}

	if(rs != null) rs.close();
%>
</div>
</body>
</html>