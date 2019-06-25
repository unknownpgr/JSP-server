<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<title>Register page</title>
</head>

<body>
	<%
		if (session.getAttribute("ID") != null)
			response.sendRedirect("./");
	%>
	<div>Register</div>
	<form action="./register_submit.jsp" method="POST">
		<div>ID</div>
		<input type="text" name="id">
		<div>PW</div>
		<input type="password" name="pw"> <br> <br> <input
			type="submit" value="Register">
	</form>
</body>

</html>