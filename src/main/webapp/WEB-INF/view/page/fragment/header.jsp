<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<style>
    body {
        font-family: Helvetica Neue,Helvetica,PingFang SC,Hiragino Sans GB,Microsoft YaHei,SimSun,sans-serif;
    }
    a {
        text-decoration: none;
    }
    .el-table__empty-block {
        height: 0%;
    }
    .el-tag{
        font-size: 18px;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: 10px;
    }
    .profile {
        float:  right;
        right:  80px;
        position:  absolute;
        top: 20px;
    }
    .el-menu-item {
        font-size: 18px;
    }
    #menu {
        margin-bottom: 20px;
    }

</style>
<div id="menu"><div>
<el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
    <el-menu-item index="1"><a href="<c:url value="/testpage"/>">Управление тестами</a></el-menu-item>
    <el-menu-item index="7"><a href="<c:url value="/runpage"/>">Прогоны</a></el-menu-item>
    <el-menu-item index="2"><a href="<c:url value="/importpage"/>">Импорт</a></el-menu-item>
    <el-menu-item index="5"><a href="<c:url value="/managepage"/>">Управление чеклистами</a></el-menu-item>
    <el-menu-item index="4"><a href="<c:url value="/projectpage"/>">Управление проектами</a></el-menu-item>
    <el-menu-item index="3"><a href="<c:url value="/userpage"/>">Управление пользователями</a></el-menu-item>
    <el-menu-item index="6"><a href="<c:url value="/reportpage"/>">Отчеты</a></el-menu-item>

</el-menu></div>
<div class="profile">
        <el-tag ><span class="el-icon-info"></span>${sessionScope.user.name}</el-tag>
        <a href="<c:url value="/logout"/>"><span>Выход</span></a>
</div>
</div>