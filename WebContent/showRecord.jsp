<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Vector" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="record.RecordDAO" %>
<%@ page import="record.Record" %>

<%
String name = request.getParameter("name");
%>

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
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
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
				
				<%
				if(userID != null){
					UserDAO userDAO = new UserDAO();
					User user = userDAO.search(userID);
					if(user.getAuth()==1){
					%>
					<li class="active"><a href="UserList.jsp">유저 관리</a>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">퀴즈 관리
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="AddQuiz.jsp">퀴즈 추가</a></li>
							<li><a href="SelectionQuiz.jsp">퀴즈 풀기</a></li>
							<li><a href="">퀴즈 관리</a></li>
							<li></li>
						</ul>
					</li>
					<%
					}else{
					%>
					<li><a href="SelectionQuiz.jsp">퀴즈 시작</a> 
					<%
					}
				}
				%>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle"
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
	UserDAO userDAO = new UserDAO();
	User user = userDAO.search(userID);
	
	RecordDAO recordDAO = new RecordDAO();
	Vector<Record> records = recordDAO.getRecord(user.getId());
	%>

	<div class="container">
	
		<div class="jumbotron">
				<div class="table-responsive">
					<div class="page-header">
						<h1 style="text-align: center">회원 정보</h1>
					</div>
					<p>닉네임 : <%=user.getName() %></p>
					<table class="table table-striped">
						<thead>
							<tr class="info">
								<th scope="col">퀴즈 그룹 명</th>
								<th scope="col">총 문제 개수</th>
								<th scope="col">맞은 문제 개수</th>
								<th scope="col">백분율</th>
							</tr>
						</thead>
						<tbody>
						<%
						for(Record rc : records){
						{
						%>
							<tr>
								<th><%=rc.getGroupName() %></th>
								<th><%=rc.getTotalCount() %></th>
								<th><%=rc.getCorrectCount() %></th>
								<th><%=rc.getPercent() %></th>
							</tr>
						<%
							}
						}
						%>
						</tbody>
					</table>
				</div>

		</div>	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>