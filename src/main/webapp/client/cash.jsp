<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>取款</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/system.css"
	type="text/css" />
<link type="text/css"
	href="${pageContext.request.contextPath }/client/css/cashAndDeposit.css"
	rel="stylesheet" />
</head>
<body onload="document.cashForm.cash.focus()">
	<%@include file="head.jsp"%>
	<div id="main">
		<div id="mainHead">
			<img src="${pageContext.request.contextPath }/client/img/ATM.jpg"
				width="800px">
			<p id="time"></p>
		</div>
		<div id="mainInfo">
			<div id="mainCash">
				<p>请输入取款金额，本系统只能取面额为100的钞票，且最多只能取走50张钞票</p>
				<form id="cashForm" name="cashForm"
					action="${pageContext.request.contextPath }/user/cash" method="post">
					<input id="cash" name="cash" type="text"
						oninput="value=value.replace(/[^\d]/g,'')" maxlength="4" />

					<c:if test="${!empty cN}"><p id="Msg"
						style="color: red; font-size: 30px; font-weight: bold;">${cN}</p>
						<c:remove var="cN" scope="request"/>
					</c:if>
				</form>
			</div>
			<div id="mainButton">
				<form action="${pageContext.request.contextPath }/client/choose.jsp">
					<button id="back">返回</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>