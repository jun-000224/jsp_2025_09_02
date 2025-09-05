<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" action="Login-Result.jsp">
		<div>
			아이디 : <input type="text" name="id">
		</div>
		<div>
			비밀번호 : <input type="text" name="pwd">
		</div>
		<input type="submit" value="submit 로그인">
		<input type="button" value="btn 로그인" onclick="fnLogin()">
	</form>
</body>
</html>
<script>
	function fnLogin(){
		let form = document.form;
		let id = form.id.value;
		let pwd = form.pwd.value;
		
		if(id.length == 0){
			alert("아이디를 입력해주세요.");
			return;
		}
		if(pwd.length == 0){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		form.submit();
		
	}
</script>




