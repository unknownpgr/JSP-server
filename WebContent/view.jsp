<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>

<head>
<title>Viewer</title>
</head>

<body>
	<a href="./">Go to Home</a>
	<%
		if (session.getAttribute("LOGIN") == null) {
			response.sendRedirect("./login.jsp");
		}
	%>
	<div>
		<%
			String id = request.getParameter("id");
			DB db = new DB();
			String[] data = db.getPost(id);
			String title = data[0];
			String content = data[1];
		%>
	</div>
	<div>
		<%
			out.println(title);
		%>
	</div>
	<div>-------------------------------------------</div>
	<div>
		<%
			out.println(content);
		%>
	</div>
</body>

</html>