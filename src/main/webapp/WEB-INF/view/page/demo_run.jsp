<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
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
        <v-container grid-list-lg>
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
        <div>
            <v-dialog v-model="dialog" max-width="500px">
                <v-btn slot="activator" color="info" dark class="mb-2">Добавить прогон</v-btn>
                <v-card>
                    <v-card-title>
                        <span class="headline">Добавить прогон</span>
                    </v-card-title>
                    <v-card-text>
                        <v-container grid-list-md>
                            <v-layout wrap>
                                <v-flex>
                                    <v-text-field v-model="newRun.name" label="Название"></v-text-field>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="blue" flat @click.native="closeRun">Отмена</v-btn>
                        <v-btn color="blue" flat @click.native="saveRun">Сохранить</v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <v-card-title>
                <v-spacer></v-spacer>
                <v-text-field
                        v-model="search"
                        append-icon="search"
                        label="Поиск"
                        single-line
                        hide-details
                ></v-text-field>
            </v-card-title>
            <v-data-table
                    :headers="headers"
                    :items="tests"
                    :search="search"
                    class="elevation-8"
            >
                <template slot="items" slot-scope="props">
                    <td>{{ props.item.id }}</td>
                    <td>{{ props.item.title }}</td>
                    <td><vue-markdown>{{ props.item.description }}</vue-markdown></td>
                    <td>{{ props.item.level }}</td>
                    <td>{{ props.item.type }}</td>
                    <td>
                        <v-edit-dialog
                                :return-value.sync="selectedStatus"
                                lazy
                        >
                            <v-select
                                    :items="statuses"
                                    v-model="props.item.status"
                                    label="Статус"
                                    single-line
                                    item-text="name"
                                    item-value="id"
                                    return-object
                                    persistent-hint
                            ></v-select>
                        </v-edit-dialog>
                    </td>
                </template>
                <v-alert slot="no-results" :value="true"  outline color="error" icon="warning">
                    Поиск по запросу "{{ search }}" не дал результатов.
                </v-alert>

                <template slot="no-data">
                    <v-alert :value="true"  outline color="error" icon="warning">
                        Выберите проект и чеклист для отображения тест-кейсов
                    </v-alert>
                </template>
            </v-data-table>
        </div>

        </v-container>
    </v-app>
</div>

<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="<spring:url value="/resources/js/json2csv.js"/>"></script>
<script src="<spring:url value="/resources/js/vue-markdown.js"/>"></script>

<script>
    Vue.use(VueMarkdown);
    new Vue({
        el: '#app',
        data: () => ({
            drawer: true,
            mini: true,
            right: null,
            search: '',
            projects:[],
            selectedProject: '',
            checklists:[],
            selectedChecklist: '',
            tests:[],
            runs: [],
            selectedRun: '',
            statuses: [],
            dialog: false,
            headers: [
                {
                    text: 'ID',
                    align: 'left',
                    value: 'id'
                },
                { text: 'Название', value: 'title' },
                { text: 'Описание', value: 'description' },
                { text: 'Уровень', value: 'level' },
                { text: 'Тип', value: 'type' },
                { text: 'Статус', value: 'status', sortable: false }
            ],
            newRun: {
                name: '',
            },
            levels:[],
            types:[],
            selectedType: '',
            selectedLevel: '',
        }),

        computed: {
        },

        watch: {
            dialog (val) {
                val || this.closeRun()
            },
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.checklists = response.data })
            },
            selectedChecklist: function () {
                axios.get('/tms/getRuns?checklistId='+this.selectedChecklist.id)
                    .then(response => {
                        this.runs = response.data })
                axios.get('/tms/getTests?checklistId='+this.selectedChecklist.id)
                    .then(response => {
                        this.tests = response.data })
            }
        },

        created () {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
            axios.get('/tms/levels')
                .then(response => {
                    this.levels = response.data })
            axios.get('/tms/types')
                .then(response => {
                    this.types = response.data })
            axios.get('/tms/status')
                .then(response => {
                    this.statuses = response.data })
        },

        methods: {
            closeRun () {
                this.dialog = false
            },

            saveRun () {
                axios({
                    method: 'POST',
                    url: '/tms/addRun',
                    data: {
                        'name': this.newRun.name,
                        'fkChecklistId': this.selectedChecklist.id
                    }
                }).then(function() {
                    console.log("done");});
                this.closeRun()
            },
        }
    })
</script>
</body>
</html>