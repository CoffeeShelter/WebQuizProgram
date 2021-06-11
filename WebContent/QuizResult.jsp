<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String quiz_group = request.getParameter("quiz_group");
String totalCount = request.getParameter("totalCount");
int rightCount = (int) session.getAttribute("rightCount");
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
	int total = Integer.parseInt(totalCount);
	float percent = ((float) rightCount / (float) total) * 100.0f;
	%>
	<div class="container">
		<h1>퀴즈 풀이 결과</h1>
		<table class="table">
			<thead>
				<tr class="info">
					<th scope="col">#</th>
					<th scope="col">문제 개수</th>
					<th scope="col">맞은 개수</th>
					<th scope="col">백분율</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><%=quiz_group%></th>
					<th><%=totalCount%></th>
					<th><%=rightCount%></th>
					<th><%=percent%>%</th>
				</tr>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>