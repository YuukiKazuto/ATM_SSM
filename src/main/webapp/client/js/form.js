var idCardNOObj;
var emailObj;
var nameObj;
var passwordObj;
var confirmObj;

var idCardNOMsg
var emailMsg;
var nameMsg;
var passwordMsg;
var confirmMsg;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
	idCardNOObj=document.getElementById("idCardNO");
	emailObj = document.getElementById("email");
	nameObj = document.getElementById("name");
	passwordObj = document.getElementById("password");
	confirmObj = document.getElementById("repassword");
	
	idCardNOMsg=document.getElementById("idCardNOMsg");
	emailMsg = document.getElementById("emailMsg");
	nameMsg = document.getElementById("nameMsg");
	passwordMsg = document.getElementById("passwordMsg");
	confirmMsg = document.getElementById("confirmMsg");
};

function checkForm() {			// 验证整个表单
	var bIdCardNO=checkIdCardNO();
	var bEmail = checkEmail();
	var bname = checkname();
	var bPassword = checkPassword();
	var bConfirm = checkConfirm();
	return bname && bPassword && bConfirm && bEmail &&bIdCardNO;	// return false后, 事件将被取消
}

function checkIdCardNO() {			// 验证邮箱
	var regex = /^[\d]{15,18}$/;
	var value =idCardNOObj.value;
	var msg = "";
	if (!value)
		msg = "身份证号必须填写：";
	else if (!regex.test(value))
		msg = "身份证号不合法：";
	idCardNOMsg.innerHTML = msg;
	idCardNOObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}
function checkEmail() {			// 验证邮箱
	var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
	var value =emailObj.value;
	var msg = "";
	if (!value)
		msg = "邮箱必须填写：";
	else if (!regex.test(value))
		msg = "邮箱格式不合法：";
	emailMsg.innerHTML = msg;
	emailObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkName() {		// 验证姓名
	var regex = /^[\u4e00-\u9fa5]{2,10}$/;	// 只能输入汉字
	var value = nameObj.value;// 获取nameObj中的文本
	var msg = "";						// 最后的提示消息, 默认为空
	if (!value)							// 如果姓名没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
		msg = "姓名必须填写：";			// 改变提示消息
	else if (!regex.test(value))		// 如果姓名不能匹配正则表达式规则
		msg = "姓名不合法：";			// 改变提示消息
	nameMsg.innerHTML = msg;		// 将提示消息放入SPAN
	nameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	// 根据消息结果改变tr的颜色
	return msg == "";					// 如果提示消息为空则代表没出错, 返回true
}

function checkPassword() {		// 验证密码
	var regex = /^[\d]{6}$/;			
	var value = passwordObj.value;
	var msg = "";
	if (!value)
		msg = "密码必须填写：";
	else if (!regex.test(value))
		msg = "密码不合法：";
	passwordMsg.innerHTML = msg;
	passwordObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkConfirm() {		// 验证确认密码
	var passwordValue = passwordObj.value;
	var confirmValue = confirmObj.value;
	var msg = "";

    if(!confirmValue){
	    msg = "确认密码必须填写";
	}
	else	if (passwordValue != confirmValue){
		msg = "密码必须保持一致";
    }
	confirmMsg.innerHTML = msg;
	confirmObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}
