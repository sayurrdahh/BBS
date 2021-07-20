<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트문장을 사용하기 위해 작성 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	session.invalidate();
%>
<script>
	location.href = 'main.jsp';
</script>

</body>
</html>