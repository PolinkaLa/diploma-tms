<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page session="true" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Login Page</title>
</head>
<body>
<div>
    <c:choose>
        <c:when test="${sessionScope.user == null}">
            <form action="<c:url value="/login" />" method="POST">
                <input type="hidden" name="from" value="${from}"/>
                <h2>Please sign in</h2>
                <h3>this is LDAP authentication</h3>
                <label for="login" >Username</label>
                <input type="text" name="login" id="login" placeholder="login" required
                       autofocus>
                <label for="inputPassword">Password</label>
                <input type="password" name="password" id="inputPassword" placeholder="Password"
                       required>
                <div>
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button type="submit">Sign in</button>
            </form>
        </c:when>
        <c:otherwise>
            <form action="<c:url value="/logout" />" method="POST">
                <h2>Welcome : ${sessionScope.user.login}</h2>
                <button type="submit">Log out</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>