<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Vector" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>

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
	Vector<User> userVector = new Vector<>();
	%>

	<div class="container">
	
		<div class="jumbotron">
			<form method="get" action="UserList.jsp">
				<div class="form-group">
					<div class="form-inline">
						<label for="search">닉네임</label>
						<input type="text" class="form-control" name="name" id="search" placeholder="유저 이름을 입력하세요">
						<button type="submit" class="btn btn-primary">검색</button>
						
						<button type="button" class="btn btn-danger pull-right" onclick="location.href='UserList.jsp'">리셋</button>
					
						<br>
					</div>
				</div>
			</form>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr class="info">
								<th scope="col">유저 이름</th>
								<th scope="col">아이디</th>
								<th scope="col">비밀번호</th>
								<th scope="col">비밀번호 찾기 질문 답</th>
								<th scope="col">권한</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(name == null || name == "")
						{
							userVector = userDAO.userList();
							for (User user : userVector)
							{
								String auth = (user.getAuth() == 1) ? "관리자" : "회원";
								String url = "location.href='EditUser.jsp?id="+ user.getId() +"'";
						%>
							<tr>
								<th><button type="button" class="btn btn-link" onclick="<%=url %>"><%=user.getName() %></button></th>
								<th><%=user.getId() %></th>
								<th><%=user.getPw() %></th>
								<th><%=user.getAnswer() %></th>
								<th><%=auth %></th>
							</tr>
						<%
							}
						}
						else
						{
							userVector = userDAO.userList(name);
							for (User user : userVector)
							{
								String auth = (user.getAuth() == 1) ? "관리자" : "회원";
								String url = "location.href='EditUser.jsp?id="+ user.getId() +"'";
						%>
							<tr>
								<th><button type="button" class="btn btn-link" onclick="<%=url %>"><%=user.getName() %></button></th>
								<th><%=user.getId() %></th>
								<th><%=user.getPw() %></th>
								<th><%=user.getAnswer() %></th>
								<th><%=auth %></th>
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