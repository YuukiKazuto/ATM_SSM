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
    <script type="text/javascript">
        function opear() {
            var password = document.getElementById("password").value;
            var form = document.getElementById("passwordForm");
            if (password.length == 6) {
                form.submit();
            }
        }
    </script>
</head>
<body onload="document.passwordForm.password.focus()">
<%@include file="head.jsp" %>
<div id="main">
    <div id="mainHead">
        <img src="${pageContext.request.contextPath }/client/img/ATM.jpg" width="800px">
        <p id="time"></p>
    </div>
    <div id="mainInfo">
        <div id="mainPassword">
            <p>请输入密码，为了保障您的账户安全，您只有三次输入机会</p>
            <form id="passwordForm" name="passwordForm" action="${pageContext.request.contextPath }/user/login2"
                  method="post">
                <input id="password" name="password" type="password"
                       oninput="value=value.replace(/[^\d]/g,'')" maxlength="6"
                       onkeyup="opear();"/>
                <c:if test="${!empty pE}">
                    <p id="passwordMsg"
                       style="color: red;font-size: 30px;font-weight: bold;"><%=request.getAttribute("pE")%>
                    </p>
                    <c:remove var="pE" scope="request"/>
                </c:if>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>