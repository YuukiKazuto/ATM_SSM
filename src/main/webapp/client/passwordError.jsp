<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>密码超限</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/system.css"
	type="text/css" />
	<style>
		#mainInfo{
			position: relative;
		}
		#mainButton{
			position: absolute;
			top: 150px;
			right: 0;
		}
	</style>
</head>
<body>
	<%@include file="head.jsp"%>
	<c:if test="${!empty user}">
		<c:remove var="user" scope="session"></c:remove>
	</c:if>
	<div id="main">
		<div id="mainHead">
			<img src="${pageContext.request.contextPath }/client/img/ATM.jpg"
				width="800px">
			<p id="time"></p>
		</div>
		<div id="mainInfo">
			<div id="mainPasswordE" style="margin:300px auto;text-align:center;color: red">
				<h1>您的密码错误已达三次，请联系柜台办理</h1>
			</div>
			<div id="mainButton" >
				<form action="#" method="post">
					<button>申请恢复</button>
				</form>
				<form action="${pageContext.request.contextPath }/client/index.jsp" method="post">
					<button style="margin-top: 50px;">退出</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>