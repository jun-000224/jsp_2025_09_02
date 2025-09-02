<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login(request)</title>
</head>
<body>

	<!-- 실습할때는 주로 get사용 예정 (일단 눈으로 보면서 사용하려고) -->
	<form action="8_loginResult.jsp" method = "post">
		<div>
			<label>아이디 : <input type = "text" name = "userId"></label>
		</div>
		<div>
			<label>패스워드 : <input type = "pasword" name = "pwd"></label>
		</div>
		<div>
			<input type = "submit" value = "로그인">
		</div>
	</form>

</body>
</html>