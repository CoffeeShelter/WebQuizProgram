<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="quiz.QuizDAO"%>
<%@ page import="quiz.Quiz"%>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String quiz_group = request.getParameter("quiz_group");
String num = request.getParameter("num");
String answer = request.getParameter("answer");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>퀴즈 프로그램</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"> 퀴즈 프로그램 </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<%
	QuizDAO quizDAO = new QuizDAO();
	Vector<Quiz> quizVector = new Vector<>();
	Quiz quiz = new Quiz();
	quizVector = quizDAO.SelectQuiz(quiz_group);

	int number = Integer.parseInt(num);
	String nextNum = Integer.toString((number + 1));

	quiz = quizVector.get(number - 1);
	System.out.println(quiz.getAnswer());
	System.out.println(answer);
	%>

	<div class="container">
		<h1><%=quiz.getQuiz_group()%></h1>
		<label for="question">			
		문제 <%=number%> / <%=quizVector.size()%>
		</label>
		<div class="jumbotron" id="question">
			<h2><%=quiz.getQuestion() %><br></h2>
		</div>
		<h3 style="color: red"><%=quiz.getAnswer()%></h3>
		<%
		if (number < quizVector.size()) {
		%>
		<form method="get" action="Quiz.jsp">
			<input type="submit" class="btn btn-primary" value="다음"> <input
				type=hidden name="num" value=<%=nextNum%>> <input
				type=hidden name="quiz_group" value="<%=quiz_group%>">
		</form>
		<%
		} else {
		%>
		<form method="get" action="QuizResult.jsp">
			<input type="submit" class="btn btn-success" value="제출"> <input
				type="hidden" name="quiz_group" value="<%=quiz_group%>"> <input
				type="hidden" name="totalCount" value="<%=quizVector.size()%>">
		</form>
		<%
		}
		%>

	</div>

	<%
	// 정답일 때
	if (quiz.getAnswer().equals(answer)) {
		int count = (int) session.getAttribute("rightCount") + 1;
		session.setAttribute("rightCount", count);
		System.out.println(count);
	%>

	<%
	// 오답일 때
	} else {
	%>

	<%
	}
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>