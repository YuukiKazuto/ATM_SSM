<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/client/css/system.css"
          type="text/css"/>
    <link type="text/css"
          href="${pageContext.request.contextPath }/client/css/login.css"
          rel="stylesheet"/>
</head>
<body onload="document.cardNOForm.id.focus()">
<%@include file="head.jsp" %>
<div id="main">
    <div id="mainHead">
        <img src="${pageContext.request.contextPath }/client/img/ATM.jpg"
             width="800px">
        <p id="time"></p>
    </div>
    <div id="mainInfo">
        <div id="maincardNO">
            <p>
                请输入卡号（6位数），确认输入无误后请按回车键提交。 <br>&nbsp;&nbsp;（如果您未拥有本系统的卡号，请点击右上角的注册）
            </p>
            <form name="cardNOForm"
                  action="${pageContext.request.contextPath}/user/login1"
                  method="post">
                <input id="id" name="id" type="text"
                       oninput="value=value.replace(/[^\d]/g,'')" maxlength="6"/>

                <c:if test="${!empty cE}">
                    <p id="cardNOMsg"
                       style="color: red; font-size: 30px; font-weight: bold;">${cE}</p>
                    <c:remove var="cE" scope="request"/>
                </c:if>
                <c:if test="${!empty iE}">
                    <p id="cardNOMsg"
                       style="color: red; font-size: 30px; font-weight: bold;">${iE}</p>
                    <c:remove var="iE" scope="request"/>
                </c:if>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>