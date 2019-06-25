<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>

<head>
<title>Write page</title>
</head>

<body>
	<%
		if (session.getAttribute("LOGIN") == null) {
			response.sendRedirect("./login.jsp");
		}
	%>
	<div>
		<a href="./logout.jsp">Logout</a>
	</div>
	<form action="./write_submit.jsp" method="POST">
		<div>
			<input type="text" name="title">
		</div>
		<div>
			<textarea name="content"></textarea>
		</div>
		<input type="submit" value="submit">
	</form>
</body>

</html>