<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Error Page</title>
</head>
<body>
<div>
    <h2>Something happened...</h2>
    <p>${errorMessage}</p>
</div>
</body>
</html>