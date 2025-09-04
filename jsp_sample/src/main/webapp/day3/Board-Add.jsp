<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
    #container {
        width: 700px;
        margin: 20px auto;
    }
    table, tr, td, th {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    th {
        background-color: #ccc;
        width: 100px;
    }
    td {
        width: 500px;
    }
    .contents {
        height: 300px;
    }
    .input-txt {
        width: 95%;
        height: 25px;
    }
</style>
</head>
<body>

<%
    // 세션에서 로그인한 사용자 ID 가져오기
    String id = (String)session.getAttribute("sessionId");

    // 오늘 날짜 구하기 (참고용 표시)
    String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>

<div id="container">
    <form name="board" action="Board-Add-Result.jsp">
        <table>
            <tr>
                <th>게시글 종류</th>
                <td>
                    <!--  1.공지사항, 2.자유, 3.문의  -->
                    <select name="kind">
                        <option value="1">공지사항</option>
                        <option value="2">자유게시판</option>
                        <option value="3">문의게시판</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" class="input-txt"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input value="<%= id %>" type="text" class="input-txt" disabled></td>
            </tr>
            <tr>
                <th>작성일</th>
                <td><input value="<%= today %>" type="text" class="input-txt" disabled></td>
            </tr>
            <tr>
                <th>내용</th>
                <td class="contents">
                    <textarea name="contents" rows="20" cols="70"></textarea>
                </td>
            </tr>
        </table>
        <div>
            <input type="button" value="작성" onclick="fnAdd()">
        </div>
    </form>
</div>

<script>
    function fnAdd(){
        let form = document.board;
        form.submit();
    }
</script>

</body>
</html>
