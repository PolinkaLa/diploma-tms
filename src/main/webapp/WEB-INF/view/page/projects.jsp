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
<%@include file="fragment/header.jsp" %>
<script>
    var Main = {
        data() {
            return {
                activeIndex: '4',
                activeIndex2: '4',

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

    <el-card class="box-card">
        <div slot="header" class="clearfix">
            <span>Проекты</span>
        </div>
        <div>


            <div v-for="project in projects" class="text item">
                {{ project.title }}
            </div>
            <el-form ref="form" :model="formAddProject" label-width="120px">
                <el-form-item label="Название">
                    <el-input v-model="formAddProject.title"></el-input>
                </el-form-item>
                </el-form-item>
                <el-form-item label="Активный">
                    <el-switch v-model="formAddProject.activeStatus"></el-switch>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="addProject">Добавить</el-button>
                </el-form-item>
            </el-form>
        </div>
    </el-card>

</div>

<script>
    ELEMENT.locale(ELEMENT.lang.en);
    var titles, currentDate;
    currentDate = "today";

    titles = [{
        prop: "title",
        label: "Title"
    }, {
        prop: "activeStatus",
        label: "Status"
    }, {
        label: 'CreatedDate',
        prop: 'createdDate'
    }]

    var Main = {
        data() {
            return {
                titles,
                formAddProject: {
                    title: '',
                    activeStatus: false
                },
                actionsDef: [],
                filteredData: [],
                projects:[],
                selectedProject:'',
            }
        },
        created() {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
        },
        watch: {
        },
        methods: {
            addProject() {
                axios({
                    method: 'POST',
                    url: '/tms/addProject',
                    data: this.formAddProject
                }).then(function() {
            console.log("done");});
            }
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
</body>
</html>
