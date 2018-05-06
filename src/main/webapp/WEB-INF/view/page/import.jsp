<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<html>
<head>
    <link rel="stylesheet" href="<spring:url value="/resources/css/index.css"/>" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        .el-select {
            margin-right: 20px;
        }
        .el-upload-list {
            height: 0%;
            width: 10%;
        }
        .upload-demo {
            margin-top: 20px;
            margin-left: 20px;
            margin-bottom: 50px;
        }
        .text {
            font-size: 14px;
        }

        .item {
            margin-bottom: 18px;
        }

        .clearfix:before,
        .clearfix:after {
            display: table;
            content: "";
        }
        .clearfix:after {
            clear: both
        }

        .box-card {
            width: 480px;
        }
    </style>
</head>
<body>

<%@include file="fragment/header.jsp" %>
<script>
    var Main = {
        data() {
            return {
                activeIndex: '2',
                activeIndex2: '2',

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
    <el-upload class="upload-demo" ref="file" action="/tms/uploadFile" :auto-upload="false" :limit="1"
               :data="{checklistId: selectedChecklist, userId: `${sessionScope.user.id}`}">
        <el-button slot="trigger" size="small" type="primary">Выбрать файл</el-button>
        <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">Импорт</el-button>
    </el-upload>
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>Пример импортируемых данных</span>
            </div>
            <div class="text item">
                <p>"ID","Title","Description","Level","Type"</p>
                <p>9,"Заголовок теста","Описание теста",1,1</p>
                <p>12,"Заголовок теста","Описание теста",1,1</p>
            </div>
        </el-card>

</div>
<script src="<spring:url value="/resources/js/vue.js"/>"></script>
<script src="<spring:url value="/resources/js/index.js"/>"></script>
<script src="<spring:url value="/resources/js/en.js"/>"></script>
<script src="<spring:url value="/resources/js/axios.min.js"/>"></script>
<script>
    ELEMENT.locale(ELEMENT.lang.en);
    var Main = {
        data() {
            return {
                projects:[],
                selectedProject:'Выбрать проект',
                checklists:[],
                selectedChecklist:'Выбрать чеклист',
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
            }
        },
        methods: {
            submitUpload() {
                this.$refs.file.submit();
            }
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
</body>
</html>
