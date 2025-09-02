<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActionInclude</title>
</head>
<body>
<%-- 	<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page ="Variable.jsp"></jsp:include> --%>
	<%@ include file = "Variable.jsp" %>
	
	<%= num1 + num2 %>
	
	<!-- 액션태그  -->
	<!-- 각 파일에서 먼저 컴파일(실행)하고 그 결과를 모아서 출력 -->
	<!-- <jsp:include page= "Variable".jsp -->
</body>
</html>