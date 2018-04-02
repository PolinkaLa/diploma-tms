<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.2.2/lib/theme-chalk/index.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
<%@include file="fragment/header.jsp" %>

<script src="https://rawgit.com/vuejs/vue/dev/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.2.2/lib/index.js"></script>
<script src="https://unpkg.com/element-ui/lib/umd/locale/en.js"></script>
<script src="https://unpkg.com/vue-data-tables@3.0.0/dist/data-tables.min.js"></script>
<script src="https://unpkg.com/json2csv@3.9.1/dist/json2csv.js"></script>
<div id="app">
    <el-select v-model="selectedProject">
        <el-option v-for="project in projects" v-bind:label="project.title" v-bind:value="project.id"></el-option>
    </el-select>
    <el-select v-model="selectedChecklist">
        <el-option v-for="checklist in checklists" v-bind:label="checklist.title" v-bind:value="checklist.id"></el-option>
    </el-select>
    <data-tables :data="tests" :actions-def="actionsDef" @filtered-data="handleFilteredData">
        <el-table-column v-for="title in titles" :prop="title.prop" :label="title.label" :key="title.label" sortable="custom">
        </el-table-column>
    </data-tables>
    <el-form ref="form" :model="formAddTest" label-width="120px">
        <el-form-item label="Название">
            <el-input v-model="formAddTest.title"></el-input>
        </el-form-item>
        <el-form-item label="Тип">
            <el-select v-model="formAddTest.type" placeholder="выбери тип">
                <el-option v-for="type in types" v-bind:label="type.name" v-bind:value="type.id"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="Уровень">
            <el-select v-model="formAddTest.level" placeholder="выбери уровень">
                <el-option v-for="level in levels" v-bind:label="level.name" v-bind:value="level.id"></el-option>
            </el-select>
        </el-form-item>

        <el-form-item label="Описание">
            <el-input type="textarea" v-model="formAddTest.description"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="addTest">Create</el-button>
            <el-button>Cancel</el-button>
        </el-form-item>
    </el-form>

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
        prop: 'fkLevelId'
    }, {
        label: 'Type',
        prop: 'fkTypeId'
    }, {
        label: 'Author',
        prop: 'fkUserId'
    }, {
        label: 'UpdatedDate',
        prop: 'updatedDate'
    }, {
        label: 'CreatedDate',
        prop: 'createdDate'
    }]

    let CsvExport = function(data, fields, fieldNames, fileName) {
        try {
            var result = json2csv({
                data: data,
                fields: fields,
                fieldNames: fieldNames,
            })
            var csvContent = 'data:text/csvcharset=GBK,\uFEFF' + result
            var encodedUri = encodeURI(csvContent)
            var link = document.createElement('a')
            link.setAttribute('href', encodedUri)
            link.setAttribute('download', `${(fileName || 'file')}.csv`)
            document.body.appendChild(link)
            link.click()
            document.body.removeChild(link)
        } catch (err) {
            console.error(err)
        }
    }

    var Main = {
        data() {
            return {
                titles,
                canNotClickList: ['id'],
                actionsDef: [],
                filteredData: [],
                projects:[],
                selectedProject:'Выбрать проект',
                checklists:[],
                selectedChecklist:'Выбрать чеклист',
                tests:[],
                total: 0,
                formAddTest: {
                    title: '',
                    type: '',
                    level: '',
                    description: ''
                },
                selectedType: '',
                selectedLevel: '',
                levels:[],
                types:[]
            }
        },
        created() {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
            axios.get('/tms/levels')
                .then(response => {
                    this.levels = response.data })
            axios.get('/tms/types')
                .then(response => {
                    this.types = response.data })
            let columns = ['id', 'title', 'description', 'fkLevelId', 'fkTypeId']
            let columnNames = ['ID', 'Title', 'Description', 'Level', 'Type']
            this.actionsDef = {
                colProps: {
                    span: 19
                },
                def: [ {
                    name: 'export',
                    handler: () => {
                        CsvExport(this.tests, columns, columnNames, "fileName")
                    },
                    buttonProps: {
                        type: 'text'
                    }
                }]
            }
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
            addTest(){
                axios({
                    method: 'POST',
                    url: '/tms/addTest',
                    data: {
                        'title': this.formAddTest.title,
                        'description': this.formAddTest.description,
                        'fkLevelId': this.formAddTest.level,
                        'fkTypeId': this.formAddTest.type,
                        'fkUserId': '1',
                        'fkChecklistId': this.selectedChecklist
                    }
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