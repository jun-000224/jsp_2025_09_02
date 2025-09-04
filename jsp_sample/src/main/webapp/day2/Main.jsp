<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
</head>
<body>
	<h1>메인페이지 입니다.</h1>
	<div>
		<button>학생관리</button>
		<button onclick="fnBoard()">게시판관리</button>
	</div>
</body>
</html>
<script>
	function fnBoard(){
		location.href = "Board-List.jsp";
	}
</script>

