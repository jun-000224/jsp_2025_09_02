<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String name = request.getParameter("userName");
		String age = request.getParameter("age");
		/* 문자를 숫자로 */
		/* js -> parseInt() */
		/* java ->  Integer.parseInt() */
		out.println("<div>" + name + "님의 나이는 " + age + " 입니다.</div>");
	%>
	
	<div>
		<%= name + "님의 나이는 " + age + " 입니다." %>
	</div>
	
	
	
	
</body>
</html>