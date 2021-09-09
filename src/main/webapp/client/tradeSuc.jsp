<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交易成功</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/client/css/system.css"
          type="text/css" />
    <style>
        #mainInfo{
            position: relative;
        }
        #mainButton{
            position: absolute;
            top: 150px;
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
        <div id="mainPasswordE" style="margin:300px auto;text-align:center;">
            <h1>交易成功，请继续交易或选择退出</h1>
        </div>
        <div id="mainButton" >
            <form action="${pageContext.request.contextPath }/client/choose.jsp" method="post">
                <button>继续交易</button>
            </form>
            <form action="${pageContext.request.contextPath }/client/index.jsp" method="post">
                <button style="margin-top: 50px;">退出</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/client/js/time.js"></script>
</body>
</html>