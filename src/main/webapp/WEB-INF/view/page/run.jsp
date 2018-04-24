<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<html>
<head>
    <link rel="stylesheet" href="<spring:url value="/resources/css/index.css"/>" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        .el-select {
            margin-right: 20px;
        }
    </style>
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
                activeIndex: '7',
                activeIndex2: '7',

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
    <el-select v-model="selectedProject">
        <el-option v-for="project in projects" v-bind:label="project.title" v-bind:value="project.id"></el-option>
    </el-select>
    <el-select v-model="selectedChecklist">
        <el-option v-for="checklist in checklists" v-bind:label="checklist.title" v-bind:value="checklist.id"></el-option>
    </el-select>
    <el-button type="success" icon="el-icon-plus" disabled>Добавить прогон</el-button>
    <data-tables :data="tests" :search-def="searchDef" @filtered-data="handleFilteredData">
        <el-table-column v-for="title in titles" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>
    </data-tables>
</div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    ELEMENT.locale(ELEMENT.lang.en);
    Vue.use(DataTables);
    Vue.use(DataTables.DataTablesServer);
    var titles, currentDate;
    currentDate = "today";

    titles = [{
        prop: "id",
        label: "ID"
    }, {
        prop: "title",
        label: "Title"
    }, {
        prop: "description",
        label: "Description"
    }, {
        label: 'Level',
        prop: 'level'
    }, {
        label: 'Type',
        prop: 'type'
    }, {
        label: 'Current',
        prop: 'current'
    }, {
        label: 'Previous',
        prop: 'previous'
    }]

    var Main = {
        data() {
            return {
                titles,
                canNotClickList: ['id'],
                projects:[],
                selectedProject:'Выбрать проект',
                checklists:[],
                selectedChecklist:'Выбрать чеклист',
                tests:[],
                searchDef: {
                    show: false
                }
            }
        },
        created() {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
        },
        watch: {
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject)
                    .then(response => {
                        this.checklists = response.data })
            },
            selectedChecklist: function () {
                axios.get('/tms/getTests?checklistId='+this.selectedChecklist)
                    .then(response => {
                        this.tests = response.data })
            }
        },
        methods: {
            handleFilteredData(filteredData) {
                this.filteredData = filteredData
            },
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
</body>
</html>