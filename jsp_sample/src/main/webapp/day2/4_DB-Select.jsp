<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4_DB-Select.jsp</title>
</head>
<body>
	<%@ include file="../db/db.jsp" %>
	<%
		ResultSet rs = null;
		String query = "SELECT * FROM STUDENT";
		rs = stmt.executeQuery(query);
		
		/* rs.next(); // 커서 이동 후 데이터가 있으면 true를 리턴. 아니면 false 리턴
		String stuName = rs.getString("STU_NAME");
		out.println(stuName + " ");
		
		rs.next(); // 커서 이동 후 데이터가 있으면 true를 리턴. 아니면 false 리턴
		stuName = rs.getString("STU_NAME");
		out.println(stuName + " ");
		
		rs.next(); // 커서 이동 후 데이터가 있으면 true를 리턴. 아니면 false 리턴
		stuName = rs.getString("STU_NAME");
		out.println(stuName + " "); */
		
		while(rs.next()){
			String stuName = rs.getString("STU_NAME");
			out.println(stuName + " ");
		}
		
	%>

</body>
</html>