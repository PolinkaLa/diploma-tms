<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<link rel="stylesheet" href="//cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css">
<div id="menu">
    <a href="<c:url value="/demo_test"/>"><v-btn outline color="blue">Управление тестами</v-btn></a></v-btn>
    <a href="<c:url value="/demo_run"/>"><v-btn outline color="blue">Прогоны</v-btn></a>
    <a href="<c:url value="/demo_import"/>"><v-btn outline color="blue">Импорт</v-btn></a>
    <a href="<c:url value="/demo_checklist"/>"><v-btn outline color="blue">Управление чеклистами</v-btn></a>
    <a href="<c:url value="/demo_project"/>"><v-btn outline color="blue">Управление проектами</v-btn></a>
    <a href="<c:url value="/demo_user"/>"><v-btn outline color="blue">Управление пользователями</v-btn></a>
    <a href="<c:url value="/demo_report"/>"><v-btn outline color="blue">Отчеты</v-btn></a>
    <v-chip label outline color="blue">
        <v-avatar color="blue">
            <span class="white--text headline">${sessionScope.user.login}</span>
        </v-avatar>
        ${sessionScope.user.name}
        <a href="<c:url value="/logout"/>" style="text-decoration: none;"><v-icon color="grey">mdi-logout-variant</v-icon></a>
    </v-chip>
</div>

