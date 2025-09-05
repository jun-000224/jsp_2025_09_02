<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file =  "../db/db.jsp" %>
	<%
	String empNo = request.getParameter("empNo"); //넘겨받은 empNo파라미터를 변수에 저장
	//WHERER EMPNO = 7369
	// 사번, 이름, 상사의 이름(MGR), 내 급여, 소속부서의 평균 급여, 부서 이름
	String query = "SELECT E.EMPNO, E.ENAME, E2.ENAME AS MGR_NAME, E.SAL, AVG_SAL, D.DNAME "
				 + "FROM EMP E "
				 + "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO "
				 + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
				 + "INNER JOIN (SELECT DEPTNO, AVG(SAL) AVG_SAL FROM EMP GROUP BY DEPTNO) T "
				 + "ON E.DEPTNO = T.DEPTNO "
				 + "WHERE E.EMPNO = '" + empNo + "'";

 	
 	try{
 		ResultSet rs = stmt.executeQuery(query);
 		//사번 : 00
 		//이름 : 00
 		String Num = rs.getString("EMPNO");
 		String Name = rs.getString("ENAME");
 		
 		out.println("사번 : " + Num);
 		out.println("이름 : " + Name);
 		
 	}catch(SQLException e){
 		out.println("오류가 발생했습니다!");
 	}
 	

%>
	%>
</body>
</html>