<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
				<li><a href="SelectionQuiz.jsp">퀴즈 시작</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="jogin.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<div class="jumbotron">
		<div class="container">
		
			<div class="page-header">
				<h1 style="text-align: center">퀴즈 문제 추가</h1>
			</div>
			<form method="get" action="AddingQuiz.jsp">
				<div class="form-group">
					<label for="textArea">문제</label>
					<textarea class="form-control" rows="10" id="textArea" name="question"></textarea>
				</div>

				<div class="form-group">
					<label for="answer">정답</label> <input type="text" name="answer"
						class="form-control" placeholder="정답" id="answer">
				</div>

				<div class="form-group">
					<label for="group">문제 그룹 명</label> <input type="text" name="quiz_group"
						class="form-control" placeholder="그룹 명" id="group">
				</div>
				
				<br>
				<input type="submit" class="btn btn-info center-block" value="퀴즈 추가">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>