<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Vector"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String answer = request.getParameter("answer");
String name = request.getParameter("name");
String auth = request.getParameter("auth");
%>

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
	User user = userDAO.search(id);
	if(pw != ""){
		user.setPw(pw);
	}
	if(answer != ""){
		user.setAnswer(answer);
	}
	if(name != ""){
		user.setName(name);
	}
	if(auth != null){
		user.setAuth(Integer.parseInt(auth));
	}
	
	int result = userDAO.update(user);
	if(result != -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보가 수정 되었습니다.')");
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