<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<title>Login page</title>
<style>
</style>
</head>

<body>
	<%
		if (session.getAttribute("ID") != null)
			response.sendRedirect("./");
	%>
	<div id="loginBox">
		<div class="flexCenter">Login</div>
		<form class="flexCenter" action="./login_submit.jsp" method="POST">
			<div>ID</div>
			<input type="text" name="id">
			<div>PW</div>
			<input type="password" name="pw"> <br> <br> <input
				type="submit" value="Login"> <a href="./register.jsp">Register</a>
		</form>
	</div>
</body>

</html>