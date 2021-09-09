<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>验证码</title>
<style type="text/css">
input {
	font-size: 20px;
	width: 350px;
	height: 25px;
	border: 1px solid black;
}

body {
	text-align: center
}
</style>
<script type="text/javascript">
	var second = 60;

	function show() {
		if (second == 0) {
			time.innerHTML = "";
			document.getElementById("b1").disabled = false;
		} else {
			second--;
			document.getElementById("b1").disabled = true;
			document.getElementById("time").innerHTML = "(" + second + ")";
		}
	}
	function reCode() {
		document.getElementById("b1").disabled = true;
		window.location.href = "${pageContext.request.contextPath }/reCode"
	}

	function reLoad() {
		setInterval(show, 1000);
	}
</script>
</head>
<body onload="document.codeForm.code.focus();reLoad();">
	<form action="${pageContext.request.contextPath }/code" method="post"
		name="codeForm">
		请输入邮箱验证码：<input type="text" name="code" id="code" />&nbsp;&nbsp;
		<button style="font-size: 20px; height: 30px;">提交</button>
	</form>
	<button id="b1" type="submit" onclick="reCode()"
		style="font-size: 20px; height: 30px;">
		<span id="time"></span>重新获取
	</button>
	<%
	if (request.getAttribute("codeE") != null) {
	%><p id="codeMsg"
		style="color: red; font-size: 30px; font-weight: bold;"><%=request.getAttribute("codeE")%></p>
	<%
	request.removeAttribute("codeE");
	}
	%>
	<%
	if (request.getAttribute("codeL") != null) {
	%><p id="codeMsg"
		style="color: red; font-size: 30px; font-weight: bold;"><%=request.getAttribute("codeL")%></p>
	<%
	request.removeAttribute("codeL");
	}
	%>
</body>
</html>