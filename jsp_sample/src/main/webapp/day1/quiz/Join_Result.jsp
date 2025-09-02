<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 결과</title>
</head>
<body>
	<%

		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd"); 
		String name = request.getParameter("userName");
		String hobby[] = request.getParameterValues("hobby");
	%>

	<div> 아이디 : <%= (id != null) ? id : "아이디가 전달되지 않았습니다." %></div>
	<div> 비밀번호 : <%= (pwd != null) ? pwd : "비밀번호가 전달되지 않았습니다." %></div>
	<div> 이름 : <%= (name != null) ? name : "이름이 전달되지 않았습니다." %></div>

  
    <div> 취미:
    <%
        if (hobby != null && hobby.length > 0) {
            for (String h : hobby) {
                out.print(h + " "); 
            }
        } else {
            out.print("선택된 취미 없음");
        }
    %>
    </div>

</body>
</html>