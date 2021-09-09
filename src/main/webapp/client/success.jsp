<%@ page import="com.kinghand.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-size: 30px">
	<%
	application.removeAttribute("user");
	%>
	注册成功
	<br> 请记住您的卡号：<%=((User) request.getAttribute("user")).getId()%>
	<br>
	<a href="${pageContext.request.contextPath }/client/index.jsp">返回首页</a>
</body>
</html>