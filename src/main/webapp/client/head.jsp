<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="head">
	<div id="headInfo">
		<div id="headLeft">
			<a href="${pageContext.request.contextPath }/index.jsp">ATM柜员机模拟系统</a>
		</div>
		<div id="headRight">
			<c:if test="${empty sessionScope.user}">
				<span>还没有卡号？</span><a href="${pageContext.request.contextPath }/client/register.jsp">注册</a>
			</c:if>
			<c:if test="${!empty sessionScope.user}">
				<span>欢迎您！${user.name}</span>
			</c:if>
		</div>
	</div>
</div>