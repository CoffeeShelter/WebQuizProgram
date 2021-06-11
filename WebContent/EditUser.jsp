<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Vector" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
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
User user = userDAO.search(id);
String deleteURL = "location.href='DeleteUser.jsp?id=" + user.getId() + "'";
%>
	<div class="container">
		<div class="jumbotron">
			<div class="page-header">
				<h1 style="text-align: center">회원 정보 수정</h1>
			</div>
			<form class="form-horizontal" action="EditingUser.jsp">
			
				<div class="form-group">
					<label class="control-label col-sm-2">아이디:</label>
					<div class="col-sm-10">
						<p class="form-control-static"><%=user.getId() %></p>
						<input type="hidden" name="id" value="<%=user.getId() %>">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="pw">비밀번호:</label>
					<div class="col-sm-10">          
						<input type="password" class="form-control" id="pw" placeholder="변경할 비밀번호를 입력해 주세요." name="pw">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="name">닉네임:</label>
					<div class="col-sm-10">          
						<input type="text" class="form-control" id="name" placeholder="변경할 닉네임을 입력해 주세요." name="name">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="answer">비밀번호 찾기 질문 답:</label>
					<div class="col-sm-10">          
						<input type="text" class="form-control" id="answer" placeholder="학번을 입력해 주세요" name="answer">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="nickName">관리자 권한 설정:</label>
					<div class="col-sm-10">
					<%
					if(user.getAuth() != 1) 
					{
					%>        
						<input class="active" type="radio" name="auth" value="0" checked> 회원
						<input class="active" type="radio" name="auth" value="1"> 관리자
					<%
					} 
					else
					{
					%>
						<input class="active" type="radio" name="auth" value="0"> 회원
						<input class="active" type="radio" name="auth" value="1" checked> 관리자
					<%
					}
					%>
					</div>
				</div>
				
				<div class="form-group">        
					<div class="col-sm-offset-2 col-sm-10">
						<div class="pull-right">
							<button type="button" class="btn btn-default" onclick="location.href='UserList.jsp'">취소</button>
						</div>
					
						<div class="pull-left">
							<button type="submit" class="btn btn-success">수정</button>
							<button type="button" class="btn btn-danger" onclick="<%=deleteURL %>">삭제</button>
						</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>