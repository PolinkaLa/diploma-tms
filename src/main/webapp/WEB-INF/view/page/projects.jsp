<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.2.2/lib/theme-chalk/index.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<script src="https://rawgit.com/vuejs/vue/dev/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.2.2/lib/index.js"></script>
<script src="https://unpkg.com/element-ui/lib/umd/locale/en.js"></script>
<script src="https://unpkg.com/vue-data-tables@3.0.0/dist/data-tables.min.js"></script>
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
    <el-form ref="form" :model="formAddProject" label-width="120px">
        <el-form-item label="Название проекта">
            <el-input v-model="formAddProject.title"></el-input>
        </el-form-item>
        </el-form-item>
        <el-form-item label="Активный проект?">
            <el-switch v-model="formAddProject.activeStatus"></el-switch>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="addProject">Create</el-button>
            <el-button>Cancel</el-button>
        </el-form-item>
    </el-form>

    <data-tables :data="projects" :actions-def="actionsDef">
        <el-table-column v-for="title in titles" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>
    </data-tables>

    <select v-model="selectedProject">
        <option v-for="project in projects" v-bind:value="project.id">{{project.title}}</option>
    </select>
    <el-form ref="form" :model="formAddChecklist" label-width="120px">
        <el-form-item label="Название чеклиста">
            <el-input v-model="formAddChecklist.title"></el-input>
        </el-form-item>
        </el-form-item>
        <el-form-item label="Активный чеклист?">
            <el-switch v-model="formAddChecklist.activeStatus"></el-switch>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="addChecklist">Create</el-button>
            <el-button>Cancel</el-button>
        </el-form-item>
    </el-form>
    <data-tables :data="checklists" :actions-def="actionsDef">
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
                checklists:[],
                total: 0,
                formAddChecklist: {
                    title: '',
                    activeStatus: false
                },
            }
        },
        created() {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
            this.actionsDef = {
                colProps: {
                    span: 19
                },
                def: []
            }
        },
        watch: {
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject)
                    .then(response => {
                        this.checklists = response.data })
            }
        },
        methods: {
            addProject() {
                axios({
                    method: 'POST',
                    url: '/tms/addProject',
                    data: this.formAddProject
                }).then(function() {
            console.log("done");});
            },
            addChecklist(){
                axios({
                    method: 'POST',
                    url: '/tms/addChecklist',
                    data: {
                        'title': this.formAddChecklist.title,
                        'activeStatus': this.formAddChecklist.activeStatus,
                        'fkProjectId': this.selectedProject
                    }
                }).then(function() {
                    console.log("done");});
            },
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
</body>
</html>
