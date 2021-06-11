<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="quiz.QuizDAO"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>퀴즈 프로그램</title>
</head>
<body>
	<%
	session.setAttribute("rightCount", 0);
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
	%>
	<script>
		location.href = 'login.jsp'
	</script>
	<%
	}
	%>
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
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<%
	QuizDAO quizDAO = new QuizDAO();
	HashMap<String, Integer> quizGroup = quizDAO.SelectQuizList();
	int num = 0;
	%>
	<div class="container">
		<h3>퀴즈 선택</h3>
		<form method="get" action="Quiz.jsp">
			<input type="hidden" name="num" value="1">
			<table class="table">
				<thead>
					<tr class="info">
						<th scope="col">#</th>
						<th scope="col">그룹 명</th>
						<th scope="col">문제 개수</th>
						<th scope="col">시작 버튼</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (String groupName : quizGroup.keySet()) {
					%>
					<tr>
						<th scope="row"><%=++num%></th>
						<th><%=groupName%></th>
						<th><%=quizGroup.get(groupName)%></th>
						<th>
							<button type="submit" class="btn btn-default" name="quiz_group"
								value="<%=groupName%>">Go</button>
						</th>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>