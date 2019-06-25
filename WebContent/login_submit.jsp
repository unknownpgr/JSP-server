<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if (id != null && pw != null) {
		DB db = new DB();
		if (db.validateUser(id, pw)) {
			session.setAttribute("LOGIN", "TRUE");
		}
	}else{
		
	}
	response.sendRedirect("./");
%>