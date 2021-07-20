<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Bean</title>
</head>
<body>
	<jsp:useBean class="beans.HelloBean" id="hello" />
	
	<jsp:getProperty property="name" name="hello"/><br>
	<jsp:getProperty property="number" name="hello"/><br>
	
	<jsp:setProperty property="name" name="hello" param="a"/>
	<jsp:setProperty property="number" name="hello" param="b"/>
	<!-- param: 질의 문자열에서 param속성에 할당된 값과 같은 name의 값으로 자바빈의 속성값을 설정 -->

	<hr>
	
	<jsp:getProperty property="name" name="hello"/><br>
	<jsp:getProperty property="number" name="hello"/><br>
	
	<!-- 질의문자열:  주소 뒤에 ?a=kim&b=34535 로 설정 -->
	<!-- http://localhost:8080/bulletin_board_system/example2.jsp?a=kim&b=34535 -->
</body>
</html>