<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script>
	// 아이디, 비밀번호가 빈값이 아닐 때만 action 실행
	function fnCheck(){
		// form 객체 가져오기
		let login = document.forms["loginForm"];

		if(login.userId.value.trim().length == 0){
			alert("아이디를 입력해주세요.");
			login.userId.focus();
			return false; // 전송 막기
		}
		if(login.pwd.value.trim().length == 0){
			alert("비밀번호를 입력해주세요.");
			login.pwd.focus();
			return false; // 전송 막기
		}
	/* 	login.submit(); //위에 조건을 모두 통과했을 때 최종 submit(action실행) */
	return true; 
	}
</script>
</head>
<body>
	<form name="loginForm" action="Quiz1_Result.jsp" method="post">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<input type="submit" value="로그인" onclick="return fnCheck()">
			<input type = "button" value = "회원가입">
		</div>
	</form>
</body>
</html>
