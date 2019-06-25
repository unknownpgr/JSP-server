<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<title>Login page</title>
</head>

<body>
	<%
		if (session.getAttribute("ID") != null)
			response.sendRedirect("./");
	%>
	<div>Login</div>
	<form action="./login_submit.jsp" method="POST">
		<div>ID</div>
		<input type="text" name="id">
		<div>PW</div>
		<input type="password" name="pw"> <br> <br> <input
			type="submit" value="Login"> <a href="./register.jsp">Register</a>
	</form>
</body>

</html>