<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<style type="text/css">
table {
	font-size: 20px
}

input {
	width: 350px;
	height: 30px;
	border: 1px solid black;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/client/js/form.js"></script>
<script type="text/javascript">
	function changeImage() {
		// 改变验证码图片中的文字
		document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time="
				+ new Date().getTime();
	}
</script>
</head>
<body>
	<div style="margin: 0 auto">
		<form action="${pageContext.request.contextPath}/register">
			<table width="1280px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px"><h1>新用户注册</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right">姓名：</td>
								<td><input type="text" class="textinput" id="name"
									name="name" onkeyup="checkName();" /></td>
								<td colspan="2"><span id="nameMsg"></span><font
									color="#999999">请输入您的真实姓名</font></td>
							</tr>
							
							<tr>
								<td style="text-align: right">身份证号码：</td>
								<td colspan="2"><input type="text" id="idCardNO"
									name="idCardNO" onkeyup="checkIdCardNO();" /></td>
								<td colspan="2"><span id="idCardNOMsg"></span><font
									color="#999999">请输入您的身份证号码</font></td>
							</tr>
							<tr>
								<td style="text-align: right; width: 20%">邮箱：</td>
								<td style="width: 40%"><input type="text" class="textinput"
									id="email" name="email" onkeyup="checkEmail();" /></td>
								<td colspan="2"><span id="emailMsg"></span><font
									color="#999999">请输入有效的邮箱地址</font></td>
							</tr>
							<tr>
								<td style="text-align: right">密码：</td>
								<td><input type="password" class="textinput" id="password"
									name="password" oninput="value=value.replace(/[^\d]/g,'')"
									maxlength="6" onkeyup="checkPassword();" /></td>
								<td><span id="passwordMsg"></span><font color="#999999">密码请设置6位纯数字字符</font></td>
							</tr>
							<tr>
								<td style="text-align: right">重复密码：</td>
								<td><input type="password" class="textinput"
									id="repassword" name="repassword"
									oninput="value=value.replace(/[^\d]/g,'')" maxlength="6"
									onkeyup="checkConfirm();" /></td>
								<td><span id="confirmMsg"></span>&nbsp;</td>
							</tr>
						</table>


						<h1>注册验证</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">输入验证码：</td>
								<td style="width: 50%"><input type="text" class="textinput" />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right; width: 20%;">&nbsp;</td>
								<td rowspan="2" style="width: 50%"><img
									src="${pageContext.request.contextPath}/imageCode" width="180"
									height="30" class="textinput" style="height: 30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
								</td>
							</tr>
						</table>
						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center"><input
									type="submit" name="submit" value="提交" border="1" width="140"
									height="35" /></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>