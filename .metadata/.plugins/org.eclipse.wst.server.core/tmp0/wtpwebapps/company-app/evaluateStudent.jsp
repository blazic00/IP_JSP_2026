<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	User user = (User) session.getAttribute("user");
	String apiUrl = "http://localhost:8080/api/company/" + user.getId()+ "/internships/";
%>
<body>
	Hello
</body>
</html>