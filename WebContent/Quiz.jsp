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
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
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

	quiz = quizVector.get(number - 1);
	%>
	<div class="container">
		<h1><%=quiz.getQuiz_group()%></h1>
		<label for="question">			
		문제 <%=number%> / <%=quizVector.size()%>
		</label>
		<div class="jumbotron" id="question">
			<h2><%=quiz.getQuestion() %><br></h2>
		</div>
		<form class="form-inline" method="get" action="QuizCheck.jsp">
			<div class="input-group mb-3">
				<input type=hidden name="num" value=<%=num%>> <input
					type=hidden name="quiz_group" value="<%=quiz_group%>">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="정답을 입력하시오"
						name="answer">
					<input type="submit" class="btn btn-primary" value="다음">
				</div>
			</div>
		</form>
	</div>
	<%

	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>