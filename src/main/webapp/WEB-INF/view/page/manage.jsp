<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@page session="true"%>
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
                                        <span>Level</span>
                                    </div>
                                    <div v-for="level in levels" class="text item">
                                        {{ level.name }}
                                    </div>
                                    <el-form ref="form" :model="formAddLevel" label-width="120px">
                                        <el-form-item label="Название">
                                            <el-input v-model="formAddLevel.name"></el-input>
                                        </el-form-item>
                                        <el-form-item>
                                            <el-button type="primary" @click="addLevel">Create</el-button>
                                        </el-form-item>
                                    </el-form>
                                </el-card>
                            </div>
                            <div>
                                <el-card class="box-card">
                                    <div slot="header" class="clearfix">
                                        <span>Type</span>
                                    </div>
                                    <div v-for="type in types" class="text item">
                                        {{ type.name }}
                                    </div>
                                    <el-form ref="form" :model="formAddType" label-width="120px">
                                        <el-form-item label="Название">
                                            <el-input v-model="formAddType.name"></el-input>
                                        </el-form-item>
                                        <el-form-item>
                                            <el-button type="primary" @click="addType">Create</el-button>
                                        </el-form-item>
                                    </el-form>
                                </el-card>
                            </div>
                        </div>
                        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
                        <script>
                            ELEMENT.locale(ELEMENT.lang.en);

                            var Main = {
                                data() {
                                    return {
                                        levels: [],
                                        types: [],
                                        formAddLevel: {
                                            name: '',
                                        },
                                        formAddType: {
                                            name: '',
                                        },
                                    }
                                },
                                created() {
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
                                }
                            }
                            var Ctor = Vue.extend(Main)
                            new Ctor().$mount('#app')
                        </script>
                </body>

                </html>