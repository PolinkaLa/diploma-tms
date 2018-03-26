<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<html>
<head>
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href="https://unpkg.com/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
<%@include file="fragment/header.jsp" %>

<div id="app">
    <v-app id="inspire">
        <div>
            <v-flex xs6>
                <v-select :items="projects" v-model="e1" label="Select Project" single-line></v-select>
            </v-flex>
            <v-flex xs6>
                <v-select :items="checklists" v-model="e1" label="Select Checklist" single-line></v-select>
            </v-flex>

            <v-dialog v-model="dialog" max-width="500px">
                <v-btn color="primary" dark slot="activator" class="mb-2">New Test Case </v-btn>
                <v-card>
                    <v-card-title>
                        <span class="headline">{{ formTitle }}</span>
                    </v-card-title>
                    <v-card-text>
                        <v-container grid-list-md>
                            <v-layout wrap>
                                <v-flex xs12 sm6 md4>
                                    <v-text-field label="Title" v-model="editedItem.title"></v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md4>
                                    <v-text-field label="Description" multi-line v-model="editedItem.description"></v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md4>
                                    <v-text-field label="Level" v-model="editedItem.level"></v-text-field>
                                </v-flex>
                                <v-flex xs12 sm6 md4>
                                    <v-text-field label="Type" v-model="editedItem.type"></v-text-field>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="blue darken-1" flat @click.native="close">Cancel</v-btn>
                        <v-btn color="blue darken-1" flat @click.native="save">Save</v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <v-card>
                <v-card-title>
                    <v-text-field
                            append-icon="search"
                            label="Search"
                            single-line
                            hide-details
                            v-model="search"
                    ></v-text-field>
                </v-card-title>
            <v-data-table :headers="headers" :items="items" :search="search" rows-per-page-text class="elevation-1">
                <template slot="items" slot-scope="props">
                    <td>{{ props.item.title }}</td>
                    <td>{{ props.item.description }}</td>
                    <td>{{ props.item.level }}</td>
                    <td>{{ props.item.type }}</td>
                    <td>{{ props.item.author }}</td>
                    <td>{{ props.item.updatedDate }}</td>
                    <td>{{ props.item.createdDate }}</td>
                    <td class="justify-center layout px-0">
                        <v-btn icon class="mx-0" @click="editItem(props.item)">
                            <v-icon color="teal">edit</v-icon>
                        </v-btn>
                        <v-btn icon class="mx-0" @click="deleteItem(props.item)">
                            <v-icon color="pink">delete</v-icon>
                        </v-btn>
                    </td>
                </template>
                <template slot="no-data">
                    <v-btn color="primary" @click="initialize">Reset</v-btn>
                </template>
            </v-data-table>
            </v-card>
        </div>
    </v-app>
</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script>
    function fetchData(){
        axios.get('/tms/getTests').then( (response) => {
            this.origs = response.data;
            return this.origs;
        })
    }
    var testsData = fetchData();

    new Vue({
        el: '#app',
        data: () => ({
            dialog: false,
            search: '',
            pagination: {},
            headers: [{
                text: 'Title',
                value: 'title'
            }, {
                text: 'Description',
                value: 'description'
            }, {
                text: 'Level',
                value: 'level'
            }, {
                text: 'Type',
                value: 'type'
            }, {
                text: 'Author',
                value: 'author'
            }, {
                text: 'UpdatedDate',
                value: 'updatedDate'
            }, {
                text: 'CreatedDate',
                value: 'createdDate'
            }],
            items: [],
            projects: [],
            checklists: [],
            editedIndex: -1,
            editedItem: {
                description: '',
                level: '',
                type: '',
                title: ''
            },
            defaultItem: {
                description: '',
                level: 0,
                type: 0,
                title: ''
            }
        }),

        computed: {
            formTitle() {
                return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
            }
        },

        watch: {
            dialog(val) {
                val || this.close()
            }
        },

        created() {
            this.initialize()
        },

        methods: {
            initialize() {
                this.items = []
                this.projects = [
                    'тестовый проект',
                    'tms',
                    'dmp',
                    'underground'

                ]
                this.checklists = [
                    'модуль авторизации',
                    'модуль тестов',
                    'моудль имопрта',
                    'модуль пользователей'
                ]
            },

            editItem(item) {
                this.editedIndex = this.items.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
            },

            deleteItem(item) {
                const index = this.items.indexOf(item)
                confirm('Are you sure you want to delete this item?') && this.items.splice(index, 1)
            },

            close() {
                this.dialog = false
                setTimeout(() => {
                    this.editedItem = Object.assign({}, this.defaultItem)
                    this.editedIndex = -1
                }, 300)
            },

            save() {
                if (this.editedIndex > -1) {
                    Object.assign(this.items[this.editedIndex], this.editedItem)
                } else {
                    this.items.push(this.editedItem)
                }
                this.close()
            },
        }
    })

</script>
</body>

</html>