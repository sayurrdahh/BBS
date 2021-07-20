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
	<!-- property : 값을 추출하려는 자바 빈즈 객체의 멤버변수 이름 -->
	<!-- name = jsp:useBean에 정의해 놓은 id속성값 -->
	<jsp:getProperty property="number" name="hello"/><br>

	<hr>

	<jsp:setProperty property="name" name="hello" value="codegizer"/><br>
	<!-- property : 값을 수정하려는 자바빈즈 객체의 멤버변수 이름 -->
	<!-- value : 변경하려는 값 -->
	<jsp:setProperty property="number" name="hello" value="12345"/><br>	

	<jsp:getProperty property="name" name="hello"/><br>
	<jsp:getProperty property="number" name="hello"/><br>

</body>
</html>