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
    <%@include file="fragment/menu.jsp" %>
    <v-app id="inspire">
        <v-container grid-list-md>
            <v-layout wrap>
                <v-flex>
        <v-select
                :items="projects"
                v-model="selectedProject"
                :hint="`${selectedProject.title}, ${selectedProject.id}`"
                label="Выбрать проект"
                single-line
                item-text="title"
                item-value="id"
                return-object
                required
        ></v-select>
                    </v-flex><v-flex>
        <v-select
                :items="checklists"
                v-model="selectedChecklist"
                :hint="`${selectedChecklist.title}, ${selectedChecklist.id}`"
                label="Выбрать чеклист"
                single-line
                item-text="title"
                item-value="id"
                return-object
                required
        ></v-select>
                </v-flex>
            </v-layout>
        <v-btn color="info" @click="CsvExport(tests)">Экспортировать</v-btn>
        <div>
            <v-dialog v-model="dialog" max-width="500px">
                <v-btn slot="activator" color="primary" dark class="mb-2">Добавить тест-кейс</v-btn>
                <v-card>
                    <v-card-title>
                        <span class="headline">{{ formTitle }}</span>
                    </v-card-title>
                    <v-card-text>
                        <v-container grid-list-md>
                            <v-layout wrap>
                                <v-flex>
                                    <v-text-field v-model="editedItem.title" label="Название"></v-text-field>
                                </v-flex>
                            </v-layout>
                            <v-layout wrap>
                                <v-flex>
                                    <v-select
                                            :items="types"
                                            v-model="editedItem.type"
                                            :hint="`${selectedType.name}, ${selectedType.id}`"
                                            label="Тип"
                                            single-line
                                            item-text="name"
                                            item-value="id"
                                            return-object
                                            persistent-hint
                                    ></v-select>
                                </v-flex>
                                <v-flex>
                                    <v-select
                                            :items="levels"
                                            v-model="editedItem.level"
                                            :hint="`${selectedLevel.name}, ${selectedLevel.id}`"
                                            label="Уровень"
                                            single-line
                                            item-text="name"
                                            item-value="id"
                                            return-object
                                            persistent-hint
                                    ></v-select>
                                </v-flex>
                            </v-layout>
                                <v-layout wrap>
                                <v-flex>
                                    <v-text-field v-model="editedItem.description" label="Описание" multi-line></v-text-field>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="blue darken-1" flat @click.native="close">Отмена</v-btn>
                        <v-btn color="blue darken-1" flat @click.native="save">Сохранить</v-btn>
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
                    pagination.sync
                    hide-actions
                    class="elevation-1"
            >
                <template slot="items" slot-scope="props">
                    <td>{{ props.item.id }}</td>
                    <td>{{ props.item.title }}</td>
                    <td>{{ props.item.description }}</td>
                    <td>{{ props.item.level }}</td>
                    <td>{{ props.item.type }}</td>
                    <td>{{ props.item.user }}</td>
                    <td>{{ props.item.uDate }}</td>
                    <td class="justify-center layout px-0">
                        <v-btn icon class="mx-0" @click="editItem(props.item)">
                            <v-icon color="teal">edit</v-icon>
                        </v-btn>
                        <v-btn icon class="mx-0" @click="deleteItem(props.item)">
                            <v-icon color="pink">delete</v-icon>
                        </v-btn>
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
                <template slot="pageText" slot-scope="{ pageStart, pageStop }">
                    From {{ pageStart }} to {{ pageStop }}
                </template>
            </v-data-table>
        </div>
    </v-app>
</div>

<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="<spring:url value="/resources/js/json2csv.js"/>"></script>
<script>
    new Vue({
        el: '#app',
        data: () => ({
            pagination: {},
            search: '',
            projects:[],
            selectedProject:'Выбрать проект',
            checklists:[],
            selectedChecklist:'Выбрать чеклист',
            tests:[],
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
                { text: 'Автор', value: 'user'},
                { text: 'Обновлен', value: 'uDate'},
                { text: 'Actions', value: 'name', sortable: false }
            ],
            editedIndex: -1,
            editedItem: {
                title: '',
                description: '',
                level: 0,
                type: 0
            },
            defaultItem: {
                title: '',
                description: '',
                level: 0,
                type: 0
            },
            levels:[],
            types:[],
            selectedType: '',
            selectedLevel: '',
        }),

        computed: {
            formTitle () {
                return this.editedIndex === -1 ? 'Добавить тест-кейс' : 'Редактировать тест-кейс'
            }
        },

        watch: {
            dialog (val) {
                val || this.close()
            },
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.checklists = response.data })
            },
            selectedChecklist: function () {
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
        },

        methods: {

            editItem (item) {
                this.editedIndex = this.tests.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
            },

            deleteItem (item) {
                const index = this.tests.indexOf(item)
                confirm('Are you sure you want to delete this item?') && this.tests.splice(index, 1)
            },

            close () {
                this.dialog = false
                setTimeout(() => {
                    this.editedItem = Object.assign({}, this.defaultItem)
                    this.editedIndex = -1
                }, 300)
            },

            save () {
                if (this.editedIndex > -1) {
                    Object.assign(this.tests[this.editedIndex], this.editedItem)
                    axios({
                        method: 'POST',
                        url: '/tms/updateTest',
                        data: {
                            'title': this.editedItem.title,
                            'description': this.editedItem.description,
                            'fkLevelId': this.editedItem.level.id,
                            'fkTypeId': this.editedItem.type.id,
                            'fkUserId': `${sessionScope.user.id}`,
                            'id': this.editedItem.id
                        }
                    }).then(function() {
                        console.log("done");});
                } else {
                    this.tests.push(this.editedItem)
                        axios({
                            method: 'POST',
                            url: '/tms/addTest',
                            data: {
                                'title': this.editedItem.title,
                                'description': this.editedItem.description,
                                'fkLevelId': this.editedItem.level.id,
                                'fkTypeId': this.editedItem.type.id,
                                'fkUserId': `${sessionScope.user.id}`,
                                'fkChecklistId': this.selectedChecklist.id
                            }
                        }).then(function() {
                            console.log("done");});
                    }
                this.close()
            },

            CsvExport(data) {
               var columns = ['id', 'title', 'description', 'fkLevelId', 'fkTypeId'];
               var  columnNames = ['ID', 'Title', 'Description', 'Level', 'Type'];
                try {
                    var result = json2csv({
                        data: data,
                        fields: columns,
                        fieldNames: columnNames,
                    })
                    var csvContent = 'data:text/csvcharset=GBK,\uFEFF' + result
                    var encodedUri = encodeURI(csvContent)
                    var link = document.createElement('a')
                    link.setAttribute('href', encodedUri)
                    link.setAttribute('download', `${("tms_export")}.csv`)
                    document.body.appendChild(link)
                    link.click()
                    document.body.removeChild(link)
                } catch (err) {
                    console.error(err)
                }
            }
        }
    })
</script>
</body>
</html>