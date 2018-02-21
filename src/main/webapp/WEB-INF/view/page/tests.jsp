<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<body>
<%@include file="fragment/header.jsp" %>

<div id="app">
    {{ message }}
</div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script>
    var testData;
    axios.get('/tms/tests')
    .then(function (response) {
        console.log(response);
    })
    .catch(function (error) {
        console.log(error);
    });

    function getUserAccount() {
        return axios.get('/tms/tests').then();
    }

    testData = getUserAccount();

    new Vue({
        el: '#app',
        data: {
            message: 'Hello Vue.js! ' + testData
        }
    })

    axios.get('/tms/tests')
        .then(function (response) {
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });
</script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
</html>
