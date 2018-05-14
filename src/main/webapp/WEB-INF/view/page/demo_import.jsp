<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href="https://unpkg.com/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
<div id="app">

    <v-app id="inspire">
        <%@include file="fragment/menu.jsp" %>
        <v-toolbar app fixed clipped-left>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>Импорт</v-toolbar-title>
        </v-toolbar>
        <v-content>
            <v-container>
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
                <el-upload class="upload-demo" ref="file" action="/tms/uploadFile" :auto-upload="false" :limit="1"
                           :data="{checklistId: selectedChecklist.id, userId: `${sessionScope.user.id}`}">
                    <v-btn outline color="info"><v-icon>attach_file</v-icon>Загрузить файл</v-btn>
                    <el-button style="margin-left: 10px;" size="small" type="primary" @click="submitUpload">upload to server</el-button>
                    <%--<v-btn color="success" @click="submitUpload">Импорт</v-btn>--%>
                </el-upload>
                <v-card v-model="importStatus">
                    <v-card-text>
                        <p>Всего обработанно {{ importStatus[0] }}</p>
                        <p>Обновлено {{ importStatus[1] }}</p>
                        <p>Скопировано в другой чеклист {{ importStatus[2] }}</p>
                        <p>Созданно новых {{ importStatus[3] }}</p>
                        <p>незагруженно {{ importStatus[4] }}</p>
                    </v-card-text>
                </v-card>
                <v-layout row wrap>
                    <v-flex>
                        <v-expansion-panel inset>
                            <v-expansion-panel-content>
                                <div slot="header">Пример импортируемых данных</div>
                                <v-card>
                                    <v-card-text>
                                        <p>"ID","Title","Description","Level","Type"</p>
                                        <p>9,"Заголовок теста","Описание теста",1,1</p>
                                        <p>12,"Заголовок теста","Описание теста",1,1</p></v-card-text>
                                </v-card>
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-flex>
                </v-layout>
            </v-container>
        </v-content>
    </v-app>
</div>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
    new Vue({
        el: '#app',
        data: () => ({
            drawer: false,
            right: null,
            projects:[],
            selectedProject:'Выбрать проект',
            checklists:[],
            selectedChecklist:'Выбрать чеклист',
            importStatus:[]
        }),

        computed: {
        },

        watch: {
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.checklists = response.data })
            },
        },

        created () {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
        },

        methods: {
            submitUpload() {
                this.$refs.file.submit();
                this.importStatus = $response.data
            }
        }
    })
</script>
</body>
</html>