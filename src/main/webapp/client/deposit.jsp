<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>存款</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/client/css/system.css"
          type="text/css"/>
    <link type="text/css"
          href="${pageContext.request.contextPath }/client/css/cashAndDeposit.css"
          rel="stylesheet"/>

</head>
<body onload="document.depositForm.deposit.focus()">
<%@include file="head.jsp" %>
<div id="main">
    <div id="mainHead">
        <img src="${pageContext.request.contextPath }/client/img/ATM.jpg"
             width="800px">
        <p id="time"></p>
    </div>
    <div id="mainInfo">
        <div id="mainDeposit">
            <p>请输入存款金额，且金额必须小于等于10000</p>
            <form id="depositForm" name="depositForm"
                  action="${pageContext.request.contextPath }/user/check?url=deposit.jsp" method="post">
                <input id="deposit" name="deposit" type="text"
                       oninput="value=value.replace(/[^\d]/g,'')" maxlength="5"/>
                <c:if test="${!empty dN}">
                    <p id="depositMsg" style="color: red; font-size: 30px; font-weight: bold;">${dN}</p>
                    <c:remove var="dN" scope="request"/>
                </c:if>
            </form>
            <img
                    src="${pageContext.request.contextPath }/client/img/deposit.png">
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