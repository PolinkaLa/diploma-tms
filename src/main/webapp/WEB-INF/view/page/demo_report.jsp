<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
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
                <v-tabs icons-and-text centered>
                    <v-tabs-slider></v-tabs-slider>
                    <v-tab href="#tab-1">
                        Статистика пользователей
                        <v-icon>group</v-icon>
                    </v-tab>
                    <v-tab href="#tab-2">
                        Прохождение тестов
                        <v-icon>check_box</v-icon>
                    </v-tab>
                    <v-tab href="#tab-3">
                        Проекты
                        <v-icon>laptop</v-icon>
                    </v-tab>
                    <v-tab href="#tab-4">
                        Статистика импорта
                        <v-icon>open_in_browser</v-icon>
                    </v-tab>
                    <v-tab-item :key="1" :id="'tab-'+'1'">
                        <v-card flat>
                            <v-card-text>
                                <pie-chart :data="testGroupByUsers"></pie-chart>
                            </v-card-text>
                        </v-card>
                    </v-tab-item>
                    <v-tab-item :key="2" :id="'tab-'+'2'">
                        <v-card flat>
                            <v-card-text>
                                <v-select
                                        :items="projects"
                                        v-model="selectedProject"
                                        label="Выбрать проект"
                                        single-line
                                        item-text="title"
                                        item-value="id"
                                        return-object
                                        required
                                ></v-select>
                                <v-select
                                        :items="checklists"
                                        v-model="selectedChecklist"
                                        label="Выбрать чеклист"
                                        single-line
                                        item-text="title"
                                        item-value="id"
                                        return-object
                                        required
                                ></v-select>
                                <v-select
                                        :items="runs"
                                        v-model="selectedRun"
                                        label="Выбрать прогон"
                                        single-line
                                        item-text="name"
                                        item-value="id"
                                        return-object
                                        required
                                ></v-select>
                                <pie-chart :data="[['n/a',this.pass],
                                    ['fail',this.fail],
                                    ['block', this.block],
                                    ['pass', this.na]]"></pie-chart>
                            </v-card-text>
                        </v-card>
                    </v-tab-item>
                    <v-tab-item :key="3" :id="'tab-'+'3'">
                        <v-card flat>
                            <v-card-text>
                                Всего проектов &nbsp;<v-badge color="green">
                                <span slot="badge" >{{ allProjects }}</span>
                            </v-badge> <br>
                                Активных проектов &nbsp;<v-badge color="green">
                                <span slot="badge" >{{ activeProjects }}</span>
                            </v-badge><br>
                                Всего чеклистов в проекте &nbsp;<v-badge color="green">
                                <span slot="badge" >{{ allChecklists }}</span>
                            </v-badge><br>
                                Активных чеклистов в проекте &nbsp;<v-badge color="green">
                                <span slot="badge" >{{ activeChecklists }}</span>
                            </v-badge><br>
                                Всего тест-кейсов в чеклисте &nbsp;<v-badge color="green">
                                <span slot="badge" >{{ allTests }}</span>
                            </v-badge><br>
                                <v-select
                                        :items="projects"
                                        v-model="selectedProject"
                                        label="Выбрать проект"
                                        single-line
                                        item-text="title"
                                        item-value="id"
                                        return-object
                                        required
                                ></v-select>
                                <v-select
                                        :items="checklists"
                                        v-model="selectedChecklist"
                                        label="Выбрать чеклист"
                                        single-line
                                        item-text="title"
                                        item-value="id"
                                        return-object
                                        required
                                ></v-select>

                            </v-card-text>
                        </v-card>
                    </v-tab-item>
                    <v-tab-item :key="4" :id="'tab-'+'4'">
                        <v-card flat>
                            <v-card-text>
                                <v-card-text>
                                    <pie-chart :data="[['Импортированные', this.imported[0]],
                                        ['Созданы через UI', this.imported[1]]]"></pie-chart>
                                </v-card-text>
                            </v-card-text>
                        </v-card>
                    </v-tab-item>
                </v-tabs>
            </v-container>
        </v-content>
    </v-app>
</div>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/chart.js@2.7.2/dist/Chart.bundle.js"></script>
<script src="https://unpkg.com/vue-chartkick@0.3.1"></script>
<script>
    Vue.use(VueChartkick, {adapter: Chart})
    new Vue({
        el: '#app',
        data: () => ({
            drawer: false,
            right: null,
            chartData: [],
            testGroupByUsers: [],
            test: [],
            projects:[],
            selectedProject:'Выбрать проект',
            checklists:[],
            selectedChecklist:'Выбрать чеклист',
            tests:[],
            allProjects: 0,
            activeProjects: 0,
            allChecklists: 0,
            activeChecklists: 0,
            allTests: 0,
            pass: 0,
            fail: 0,
            block: 0,
            na: 0,
            imported: [],
        }),

        computed: {},

        watch: {
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.checklists = response.data })
                axios.get('/tms/numberOfAllChecklist?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.allChecklists = response.data })
                axios.get('/tms/numberOfActiveChecklist?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.activeChecklists = response.data })
            },
            selectedChecklist: function () {
                axios.get('/tms/numberOfTests?checklistId='+this.selectedChecklist.id)
                    .then(response => {
                        this.allTests = response.data })
            }
        },

        created() {
            axios.get('/tms/testGroupByUsers')
                .then(response => {
                    this.chartData = response.data
                    for (var i = 0; i < this.chartData.length; i++) {
                        this.test[i] = [this.chartData[i].name, this.chartData[i].value]
                    }
                    this.testGroupByUsers = this.test
                })
            axios.get('/tms/numberOfAllProject')
                .then(response => {
                    this.allProjects = response.data })
            axios.get('/tms/numberOfactiveProject')
                .then(response => {
                    this.activeProjects = response.data })
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
            axios.get('/tms/imported')
                .then(response => {
                    this.imported = response.data })
        },

        methods: {}
    })
</script>
</body>
</html>