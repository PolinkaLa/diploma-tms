<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<div id="menu"><div>
    <a href="<c:url value="/demo_test"/>"><v-btn outline color="indigo">Управление тестами</v-btn></a></v-btn>
    <a href="<c:url value="/demo_run"/>"><v-btn outline color="indigo">Прогоны</v-btn></a>
    <a href="<c:url value="/demo_import"/>"><v-btn outline color="indigo">Импорт</v-btn></a>
    <a href="<c:url value="/demo_checklist"/>"><v-btn outline color="indigo">Управление чеклистами</v-btn></a>
    <a href="<c:url value="/demo_project"/>"><v-btn outline color="indigo">Управление проектами</v-btn></a>
    <a href="<c:url value="/demo_user"/>"><v-btn outline color="indigo">Управление пользователями</v-btn></a>
    <a href="<c:url value="/demo_report"/>"><v-btn outline color="indigo">Отчеты</v-btn></a>
</div>
    <div class="profile">
        <span></span>${sessionScope.user.name}
        <a href="<c:url value="/logout"/>"><span>Выход</span></a>
    </div>
</div>
