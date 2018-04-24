<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<html>
<head>
    <link rel="stylesheet" href="<spring:url value="/resources/css/index.css"/>" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<script src="<spring:url value="/resources/js/vue.js"/>"></script>
<script src="<spring:url value="/resources/js/index.js"/>"></script>
<script src="<spring:url value="/resources/js/en.js"/>"></script>
<script src="<spring:url value="/resources/js/axios.min.js"/>"></script>
<script src="<spring:url value="/resources/js/data-tables.min.js"/>"></script>

<%@include file="fragment/header.jsp" %>
<script>
    var Main = {
        data() {
            return {
                activeIndex: '3',
                activeIndex2: '3',

            };
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            }
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#menu')
</script>
<div id="app">

    <data-tables :data="users">
        <el-table-column v-for="title in titles" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>
    </data-tables>

</div>

<script>
    ELEMENT.locale(ELEMENT.lang.en);
    Vue.use(DataTables);
    Vue.use(DataTables.DataTablesServer);
    var titles, currentDate;


    titles = [{
        prop: "login",
        label: "login"
    }, {
        prop: "name",
        label: "Name"
    }, {
        prop: "email",
        label: "Email"
    }, {
        label: 'Role',
        prop: 'role'
    }]
    var Main = {
        data() {
            return {
                titles,
                users:[],
            }
        },
        created() {
            axios.get('/tms/users')
                .then(response => {
                    this.users = response.data })
        },
        watch: {
        },
        methods: {
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
</div>
</body>
</html>
