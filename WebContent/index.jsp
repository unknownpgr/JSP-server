<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%@ page import="java.util.HashMap"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>

<head>
<title>Main page</title>
</head>

<body>
	<%
		if (session.getAttribute("LOGIN") == null) {
			response.sendRedirect("./login.jsp");
		}
	%>
	<div>
		<a href="./logout.jsp">Logout</a> <a href="./write.jsp">Write a
			post</a>
		<div>List of post</div>
		<form action="./" method="GET">
			<div>
				<%
					String query = request.getParameter("query");
					if (query == null)
						query = "";
				%>
				Search : <input type="text" name="query"
					value="<%out.println(query);%>"> <input type="submit"
					value="search">
			</div>
		</form>
		<div>
			<%
				DB db = new DB();
				HashMap<Integer, String> posts;
				if (query == null || query.length() < 1) {
					posts = db.listPost();
				} else {
					posts = db.searchPost(query);
				}
				if (posts.size() > 0) {
					for (int index : posts.keySet()) {
						out.println("<div><a href='./view.jsp?id=" + index + "'>" + posts.get(index) + "</div>");
					}
				}
			%>
		</div>
	</div>
</body>

</html>