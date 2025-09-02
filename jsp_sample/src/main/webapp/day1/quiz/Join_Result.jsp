<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 결과</title>
</head>
<body>
	<h2>가입 결과</h2>
	<%
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String[] hobby = request.getParameterValues("hobby");
	%>

	<div>아이디 : <%= userId %></div>
	<div>이름 : <%= userName %></div>
	<div>
		취미 :
		<%
			if(hobby != null){
				for(int i=0; i<hobby.length; i++){
					out.print(hobby[i]);
					if(i < hobby.length-1) out.print(", ");
				}
			}else{
				out.println("선택하지 않음");
			}
		%>
	</div>
</body>
</html>
