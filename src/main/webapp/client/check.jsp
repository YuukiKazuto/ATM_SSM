<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>确认</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/system.css"
	type="text/css" />
	<style>
		#checkBox table{
			width: 500px;
			height: 300px;
			margin: 170px auto 0 auto;
			font-size: 20px;
			border: 1px black solid;
		}
		td{
			text-align: center;
			border: 1px black solid;
		}
		#mainInfo{
			position: relative;
		}
		#mainButton{
			position: absolute;
			top: 250px;
			right: 0;
		}

	</style>
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
			<div id="checkBox">
				<table>
					<tr>
						<td colspan="2">请确认您的存入账号和金额</td>
					</tr>
					<tr>
						<td>卡号</td>
						<td>${cardNO}</td>
					</tr>
					<tr>
						<td>金额</td>
						<td>${deposit }</td>
					</tr>
				</table>
			</div>
			<div id="mainButton" >
				<form action="${pageContext.request.contextPath }/user/${method}?deposit=${deposit}" method="post">
					<button >确认</button>
				</form>
				<form
						action="${pageContext.request.contextPath }/client/choose.jsp">
					<button style="margin-top: 50px;">返回</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>