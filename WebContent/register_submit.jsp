<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id + "/" + pw);
	String msg = null;
	if (id != null && pw != null && id.length() > 0 && pw.length() > 0) {
		DB db = new DB();
		msg = db.addUser(id, pw);
	} else {
		msg = "ID or password is null";
	}
	if (msg == null) {
		msg = "User successfully registered.";
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