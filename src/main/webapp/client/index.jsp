<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ATM模拟系统</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/client/css/system.css"
          type="text/css"/>
    <link type="text/css"
          href="${pageContext.request.contextPath }/client/css/index.css"
          rel="stylesheet"/>
</head>
<body>
<c:if test="${!empty sessionScope.user}">
    <c:remove var="user" scope="session"/>
</c:if>
<%@include file="head.jsp" %>
<div id="main">
    <div id="mainHead">
        <img src="${pageContext.request.contextPath }/client/img/ATM.jpg" width="800px">
    </div>
    <div id="mainInfo">
        <div id="mainBanner">
            <img src="${pageContext.request.contextPath }/client/img/5.jpg" alt="5">
        </div>
        <div id="mainButton">
            <form action="${pageContext.request.contextPath }/client/login1.jsp">
                <button>无卡交易</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>