<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>功能选择</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/system.css"
	type="text/css" />
<link type="text/css"
	href="${pageContext.request.contextPath }/client/css/choose.css"
	rel="stylesheet" />
</head>
<body>
	<%@include file="head.jsp"%>
	<div id="main">
		<div id="mainHead">
			<img src="${pageContext.request.contextPath }/client/img/ATM.jpg"
				width="800px">
				<p id="time"></p>
		</div>
		<div id="mainInfo">
			<div id="mainButton2">
				<form
					action="${pageContext.request.contextPath }/client/transfer.jsp">
					<button id="transfer">转账</button>
				</form>
				<form
					action="${pageContext.request.contextPath }/client/history.jsp">
					<button id="history">交易记录</button>
				</form>
				<form action="${pageContext.request.contextPath }/client/index.jsp">
					<button id="exit">退出</button>
				</form>
			</div>
			<div id="mainButton1">
				<form action="${pageContext.request.contextPath }/client/cash.jsp">
					<button id="cash">取款</button>
				</form>
				<form
					action="${pageContext.request.contextPath }/client/deposit.jsp">
					<button id="deposit">存款</button>
				</form>
			</div>
		</div>
		<div id="mainText">
			<p>请选择您需要进行的交易</p>
			<p>
				您的账户余额为：${sessionScope.user.money}</p>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>