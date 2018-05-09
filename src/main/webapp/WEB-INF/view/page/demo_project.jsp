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
        <v-container grid-list-lg>
            <div>
                <v-dialog v-model="dialog" max-width="500px">
                    <v-btn slot="activator" color="primary" dark class="mb-2">Добавить проект</v-btn>
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
                                        <v-checkbox
                                                :label="`Активный проект: ${editedItem.activeStatus.toString()}`"
                                                v-model="editedItem.activeStatus"
                                        ></v-checkbox>
                                    </v-flex>
                                </v-layout>

                            </v-container>
                        </v-card-text>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn color="blue" flat @click.native="close">Отмена</v-btn>
                            <v-btn color="blue" flat @click.native="save">Сохранить</v-btn>
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
                    ></v-text-field>
                </v-card-title>
                <v-data-table
                        :headers="headers"
                        :items="projects"
                        :search="search"
                        class="elevation-8"
                >
                    <template slot="items" slot-scope="props">
                        <td>{{ props.item.title }}</td>
                        <td>{{ props.item.activeStatus }}</td>
                        <td>{{ props.item.cDate }}</td>
                        <td class="layout px-0">
                            <v-btn icon class="mx-0" @click="editItem(props.item)">
                                <v-icon color="grey">edit</v-icon>
                            </v-btn>
                        </td>
                    </template>
                    <v-alert slot="no-results" :value="true"  outline color="error" icon="warning">
                        Поиск по запросу "{{ search }}" не дал результатов.
                    </v-alert>

                    <template slot="no-data">
                        <v-alert :value="true"  outline color="error" icon="warning">
                            Ни одного проекта еще не создано
                        </v-alert>
                    </template>
                    <template slot="pageText" slot-scope="{ pageStart, pageStop }">
                        From {{ pageStart }} to {{ pageStop }}
                    </template>
                </v-data-table>
            </div>
        </v-container>
    </v-app>
</div>

<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data: () => ({
            pagination: {},
            search: '',
            projects:[],
            dialog: false,
            headers: [
                { text: 'Название', value: 'title' },
                { text: 'Статус', value: 'activeStatus' },
                { text: 'Дата создания', value: 'сDate'},
                { text: '', value: 'name', sortable: false }
            ],
            editedIndex: -1,
            editedItem: {
                title: '',
                activeStatus: ''
            },
            defaultItem: {
                title: '',
                activeStatus: ''
            },
        }),

        computed: {
            formTitle () {
                return this.editedIndex === -1 ? 'Добавить проект' : 'Редактировать проект'
            }
        },

        watch: {
            dialog (val) {
                val || this.close()
            }
        },

        created () {
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
        },

        methods: {

            editItem (item) {
                this.editedIndex = this.projects.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
            },

            deleteItem (item) {
                const index = this.projects.indexOf(item)
                confirm('Are you sure you want to delete this item?') && this.projects.splice(index, 1)
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
                    Object.assign(this.projects[this.editedIndex], this.editedItem)
                    axios({
                        method: 'POST',
                        url: '/tms/updateProject',
                        data: {
                            'title': this.editedItem.title,
                            'activeStatus': this.editedItem.activeStatus,
                            'id': this.editedItem.id
                        }
                    }).then(function() {
                        console.log("done");});
                } else {
                    this.projects.push(this.editedItem)
                    axios({
                        method: 'POST',
                        url: '/tms/addProject',
                        data: {
                            'title': this.editedItem.title,
                            'activeStatus': this.editedItem.activeStatus
                        }
                    }).then(function() {
                        console.log("done");});
                }
                this.close()
            },
        }
    })
</script>
</body>
</html>