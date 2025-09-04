<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Result.jsp</title>
</head>
<body>

	<%@ include file="../db/db.jsp" %>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		ResultSet rs = null;
		String query =    "SELECT * FROM TBL_USER "
						+ "WHERE USERID = '" + userId + "' "
						+ "AND PASSWORD = '" + pwd + "'";
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
			/* out.println("로그인 성공"); */
			String id = rs.getString("USERID");
			String status = rs.getString("STATUS");
			session.setAttribute("sessionId", id);  // 키값 sessionId
			session.setAttribute("sessionStatus", status);
			session.setMaxInactiveInterval(60 * 30); //초단위는 계산보단 그냥 저런식으로 입력한다. 
			
			
			response.sendRedirect("Main.jsp");
		} else {
			out.println("로그인 실패");
		}
		
	%>




</body>
</html>