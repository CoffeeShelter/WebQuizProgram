<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Vector"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="answer" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>퀴즈 프로그램</title>
<body>
	<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.delete(id);
	if(result != -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보가 삭제 되었습니다.')");
		script.println("location.href='UserList.jsp'");
		script.println("</script>");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("location.href='UserList.jsp'");
		script.println("</script>");
	}
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>