<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  오부 클래스는 imnport해서 사용해야한다. -->
	<!--  자바랑 import방법이 차이가 있다.; -->\
	
	<%@ page import = "java.util.Date" %>
	
	<%= (new Date()).toLocaleString() %>
	
</body>
</html>