<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVA Bean</title>
</head>
<body>
	<jsp:useBean class="beans.HelloBean" id="hello" />
	
	<jsp:getProperty property="name" name="hello"/><br>
	<jsp:getProperty property="number" name="hello"/><br>
	
	<jsp:setProperty property="*" name="hello"/>

	<hr>
	
	<jsp:getProperty property="name" name="hello"/><br>
	<jsp:getProperty property="number" name="hello"/><br>
		<!-- 질의문자열 파라미터 이름이 name과 number가 된다? -->
	
</body>
</html>