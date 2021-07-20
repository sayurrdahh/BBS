<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트문장을 사용하기 위해 작성 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8로 받는다 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> <!-- page내에서만 빈즈 사용 -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%	
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");	
	}

	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {

		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력해주세요!')");
			script.println("history.back()");
			script.println("</script>");
		} else { 
			BbsDAO bbsDAO = new BbsDAO();
			
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 성공!')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}		
		}
		}
	%>
</body>
</html>