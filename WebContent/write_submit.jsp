<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("LOGIN") == null) {
		response.sendRedirect("./login.jsp");
	}
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println(title + "\n======================\n" + content);
	String msg = null;
	if (title != null && content != null && title.length() > 0 && content.length() > 0) {
		DB db = new DB();
		msg = db.addPost(title, content);
	} else {
		msg = "Title or content is null";
	}
	if (msg == null) {
		msg = "Sucessfully posted.";
	}
%>
<html>
<head></head>
<body>
	<script>
		
	<%out.println("alert(\"" + msg + "\");");%>
		location.href = '/'
	</script>
</body>
</html>