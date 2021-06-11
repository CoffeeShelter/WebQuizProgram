<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="quiz.QuizDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="quiz" class="quiz.Quiz" scope="page" />
<jsp:setProperty name="quiz" property="quiz_group" />
<jsp:setProperty name="quiz" property="question" />
<jsp:setProperty name="quiz" property="answer" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>퀴즈 프로그램</title>
</head>
<body>
	<%
	if(quiz.getQuestion() == null || quiz.getAnswer() == null || quiz.getQuiz_group() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		QuizDAO quizDAO = new QuizDAO();
		quizDAO.AddQuiz(quiz);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추가되었습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>