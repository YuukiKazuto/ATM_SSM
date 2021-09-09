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
<body onload="document.transferForm.transferCardNO.focus()">
<%@include file="head.jsp" %>
<div id="main">
    <div id="mainHead">
        <img src="${pageContext.request.contextPath }/client/img/ATM.jpg"
             width="800px">
        <p id="time"></p>
    </div>
    <div id="mainInfo">
        <div id="mainTransfer">
            <form id="transferForm" name="transferForm"
                  action="${pageContext.request.contextPath }/user/check?url=transfer.jsp" method="post">
                <h2>请输入对方账号</h2>
                <input id="transferCardNO" name="cardNO" type="text"
                       oninput="value=value.replace(/[^\d]/g,'')"/><br/>
                <br/>
                <c:if test="${!empty tCE}">
                    <p id="transferMsg" style="color: red; font-size: 30px; font-weight: bold;">${tCE}</p>
                    <c:remove var="tCE" scope="request"/>
                </c:if>
                <h2>请输入转账金额,转账金额必须大于0</h2>
                <input id="transferMoney" name="deposit" type="text"
                       oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')"/><br/>
                <c:if test="${!empty tDE}">
                    <p id="transferMsg" style="color: red; font-size: 30px; font-weight: bold;">${tDE}</p>
                    <c:remove var="tCE" scope="request"/>
                </c:if>
            </form>
        </div>
        <div id="mainButton" style="margin-top: 100px">
            <button form="transferForm" type="submit">提交</button>
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