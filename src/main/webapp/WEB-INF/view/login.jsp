<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page session="true" %>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.2.2/lib/theme-chalk/index.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Login Page</title>
    <style>
        .login{
            text-align: center;
            margin: auto;
            width: 25%;
        }
        .el-input{
            margin-bottom: 20px;
        }
        .el-button{
            width: 100%;
        }
        .logo {
            margin-top: 50px;
            margin-left: 50px;
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
<div>
    <c:choose>
        <c:when test="${sessionScope.user == null}">
            <div class="logo">
                <img src="<spring:url value="/resources/logo_0.png"/>">
            </div>
            <div class="login">
            <form action="<c:url value="/login" />" method="POST">
                <input type="hidden" name="from" value="${from}"/>
                <div><h2>Please sign in</h2></div>
                <div class="el-input el-input--suffix">
                    <input class="el-input__inner" type="text" name="login" id="login" placeholder="Login" required
                       autofocus>
                    <span class="el-input__suffix"><span class="el-input__suffix-inner"><i class="el-icon-edit el-input__icon"></i><!----></span><!----></span>
                </div>
                <div class="el-input el-input--suffix"><input class="el-input__inner" type="password" name="password" id="inputPassword" placeholder="Password" required>
                    <span class="el-input__suffix"><span class="el-input__suffix-inner"><i class="el-icon-edit el-input__icon"></i><!----></span><!----></span></div>

                <div><button class="el-button el-button--primary" type="submit">Sign in</button></div>
            </form>
            </div>
        </c:when>
        <c:otherwise>
            <form action="<c:url value="/logout" />" method="POST">
                <h2>Welcome : ${sessionScope.user.login}</h2>
                <button class="el-button el-button--primary" type="submit">Log out</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>