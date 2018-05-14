<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href="https://unpkg.com/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
<div id="app">

    <v-app id="inspire">
        <%@include file="fragment/menu.jsp" %>
        <v-toolbar app fixed clipped-left>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>Отчеты</v-toolbar-title>
        </v-toolbar>
        <v-content>
        <v-container>


        </v-container>
        </v-content>
    </v-app>
</div>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="<spring:url value="/resources/js/Chart.min.js"/>"></script>
<script src="<spring:url value="/resources/js/vue-chartjs.min.js"/>"></script>
<script>
    new Vue({
        el: '#app',
        data: () => ({
            drawer: false,
            right: null,

        }),

        computed: {

        },

        watch: {

        },

        created () {

        },

        methods: {

        }
    })
</script>
</body>
</html>