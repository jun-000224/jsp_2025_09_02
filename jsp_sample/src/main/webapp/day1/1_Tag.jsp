<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- java.util.Date 클래스를 올바르게 임포트합니다. --%>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 날짜 출력</title>
</head>
<body>
    <h1>현재 시간: <%= new Date() %></h1>
</body>
</html>