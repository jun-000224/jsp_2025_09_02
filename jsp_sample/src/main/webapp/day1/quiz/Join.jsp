<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입l12223333llll</title>
<script>
	function validateForm(){  
		let form = document.joinForm;

		// 아이디 검사 (6글자 이상)
		if(form.userId.value.trim().length < 6){
			alert("아이디는 최소 6글자 이상이어야 합니다.");
			form.userId.focus();
			return false;
		}

		// 비밀번호 검사 (8글자 이상, 특수문자 포함)
		let pwd = form.pwd.value;
		let pwdChk = form.pwdChk.value;
		let regExp = /^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/; //정규식 부분

		if(!regExp.test(pwd)){
			alert("비밀번호는 8글자 이상이며, 특수문자를 포함해야 합니다.");
			form.pwd.focus();
			return false;
		}

		// 비밀번호 확인
		if(pwd !== pwdChk){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			form.pwdChk.focus();
			return false;
		}

		// 이름 검사 (빈값 불가)
		if(form.userName.value.trim() === ""){
			alert("이름을 입력해주세요.");
			form.userName.focus();
			return false;
		}

		// 취미는 선택 안 해도 됨

		return true; // 모든 검증 통과
	}
</script>
</head>
<body>
	<h2>회원가입</h2>
	<form name="joinForm" action="Join_Result.jsp" method="post" onsubmit="return validateForm()">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input type="password" name="pwdChk"></label>
		</div>
		<div>
			<label>이름 : <input type="text" name="userName"></label>
		</div>
		<div>
			취미 :
			<label><input type="checkbox" name="hobby" value="축구">축구</label>
			<label><input type="checkbox" name="hobby" value="영화">영화</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
			<label><input type="checkbox" name="hobby" value="수집">수집</label>
		</div>
		<div>
			<input type="submit" value="가입하기">
		</div>
	</form>
</body>
</html>
