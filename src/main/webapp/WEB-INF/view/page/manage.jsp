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
                        .el-card {
                            width: 50%;
                            margin-bottom: 20px;
                            margin-left: 20px;
                        }
        .el-select {
            margin-bottom: 20px;
        }
        .el-form {
            margin-top: 20px;
        }

    </style>
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
                                        activeIndex: '5',
                                        activeIndex2: '5',

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


                            <div>
                                <el-card class="box-card">
                                    <div slot="header" class="clearfix">
                                        <span>Чеклисты</span>
                                    </div>
                                    <div>

                                    <el-select v-model="selectedProject">
                                        <el-option v-for="project in projects" v-bind:label="project.title" v-bind:value="project.id"></el-option>
                                    </el-select>
                                <div v-for="checklist in checklists" class="text item">
                                        {{ checklist.title }}
                                </div>
                                <el-form ref="form" :model="formAddChecklist" label-width="120px">
                                    <el-form-item label="Название">
                                        <el-input v-model="formAddChecklist.title"></el-input>
                                    </el-form-item>
                                    </el-form-item>
                                    <el-form-item label="Активный">
                                        <el-switch v-model="formAddChecklist.activeStatus"></el-switch>
                                    </el-form-item>
                                    <el-form-item>
                                        <el-button type="primary" @click="addChecklist">Добавить</el-button>
                                    </el-form-item>
                                </el-form>
                                    </div>
                                </el-card>
                            </div>
                            <div>
                                <el-card class="box-card">
                                    <div slot="header" class="clearfix">
                                        <span>Уровни</span>
                                    </div>
                                    <div v-for="level in levels" class="text item">
                                        {{ level.name }}
                                    </div>
                                    <el-form ref="form" :model="formAddLevel" label-width="120px">
                                        <el-form-item label="Название">
                                            <el-input v-model="formAddLevel.name"></el-input>
                                        </el-form-item>
                                        <el-form-item>
                                            <el-button type="primary" @click="addLevel">Добавить</el-button>
                                        </el-form-item>
                                    </el-form>
                                </el-card>
                            </div>
                            <div>
                                <el-card class="box-card">
                                    <div slot="header" class="clearfix">
                                        <span>Типы</span>
                                    </div>
                                    <div v-for="type in types" class="text item">
                                        {{ type.name }}
                                    </div>
                                    <el-form ref="form" :model="formAddType" label-width="120px">
                                        <el-form-item label="Название">
                                            <el-input v-model="formAddType.name"></el-input>
                                        </el-form-item>
                                        <el-form-item>
                                            <el-button type="primary" @click="addType">Добавить</el-button>
                                        </el-form-item>
                                    </el-form>
                                </el-card>
                            </div>
                        </div>

                        <script>
                            ELEMENT.locale(ELEMENT.lang.en);

                            var Main = {
                                data() {
                                    return {
                                        projects:[],
                                        checklists:[],
                                        levels: [],
                                        types: [],
                                        selectedProject:'Выбрать проект',
                                        formAddLevel: {
                                            name: '',
                                        },
                                        formAddType: {
                                            name: '',
                                        },


                                        formAddChecklist: {
                                            title: '',
                                            activeStatus: false
                                        }
                                    }
                                },
                                created() {
                                    axios.get('/tms/projects')
                                        .then(response => {
                                            this.projects = response.data
                                        })
                                    axios.get('/tms/levels')
                                        .then(response => {
                                            this.levels = response.data
                                        })
                                    axios.get('/tms/types')
                                        .then(response => {
                                            this.types = response.data
                                        })

                                },
                                watch: {
                                    selectedProject: function () {
                                        axios.get('/tms/checklists?projectId='+this.selectedProject)
                                            .then(response => {
                                                this.checklists = response.data })
                                    }
                                },
                                methods: {
                                    addLevel() {
                                        axios({
                                            method: 'POST',
                                            url: '/tms/addLevel',
                                            data: this.formAddLevel
                                        }).
                                        then(function () {
                                            axios.get('/tms/levels')
                                                .then(response => {
                                                    this.levels = response.data
                                                })
                                            console.log("done");
                                        });
                                    },
                                    addType() {
                                        axios({
                                            method: 'POST',
                                            url: '/tms/addType',
                                            data: this.formAddType
                                        }).then(function () {
                                            console.log("done");
                                        });
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