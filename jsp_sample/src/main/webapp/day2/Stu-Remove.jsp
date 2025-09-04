<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <%-- SQL 관련 클래스를 사용하기 위해 임포트 --%>
<%@ include file="../db/db.jsp" %> <%-- 데이터베이스 연결 정보를 가져옵니다 --%>

<%
    String stuNo = request.getParameter("stuNo"); // Stu-List.jsp에서 전달받은 학번 파라미터를 가져옴

    if (stuNo != null && !stuNo.trim().isEmpty()) {
        String deleteQuery = "DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
        int result = 0;
        
        result = stmt.executeUpdate(deleteQuery);

    } 

    response.sendRedirect("Stu-List.jsp");
%>