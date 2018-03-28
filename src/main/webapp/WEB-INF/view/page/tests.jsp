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
    <select v-model="selectedProject">
        <option v-for="project in projects" v-bind:value="project.id">{{project.title}}</option>
    </select>
    <select v-model="selectedChecklist">
        <option v-for="checklist in checklists" v-bind:value="checklist.id">{{checklist.title}}</option>
    </select>
    <data-tables :data="tests" :actions-def="actionsDef" @filtered-data="handleFilteredData">
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
                total: 0
            }
        },
        created() {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
            let columns = ['id', 'title', 'description', 'fkLevelId', 'fkTypeId']
            let columnNames = ['ID', 'Title', 'Description', 'Level', 'Type']
            this.actionsDef = {
                colProps: {
                    span: 19
                },
                def: [{
                    name: 'new',
                    handler: () => {
                        this.tests.push({
                            'id': '###',
                            'title': 'enter test title',
                            'description': 'enter test description',
                            'fkLevelId': 'enter test level',
                            'fkTypeId': 'enter test type',
                            'fkUserId': `${sessionScope.user.name}`,
                            'updatedDate': currentDate,
                            'createdDate': currentDate
                        })
                    },
                    buttonProps: {
                        type: 'text'
                    }
                }, {
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
            }
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
</body>
</html>