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
        <v-toolbar app fixed clipped-left>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>Управление чеклистами</v-toolbar-title>
        </v-toolbar>
        <v-content>
        <v-container grid-list-lg app>
            <div>
                    <v-dialog v-model="dialogType" max-width="500px">
                        <v-btn slot="activator" color="primary" dark class="mb-2">Добавить Тип</v-btn>
                        <v-card>
                            <v-card-title>
                                <span class="headline">{{ formTitleType }}</span>
                            </v-card-title>
                            <v-card-text>
                                <v-container grid-list-md>
                                    <v-layout wrap>
                                        <v-flex>
                                            <v-text-field v-model="editedItemType.name" label="Название"></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-container>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue" flat @click.native="closeType">Отмена</v-btn>
                                <v-btn color="blue" flat @click.native="saveType">Сохранить</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <v-data-table
                            :headers="typeHeader"
                            :items="types"
                            hide-actions
                            class="elevation-1"
                    >
                        <template slot="items" slot-scope="props">
                            <td>{{ props.item.name }}</td>
                            <td class=" layout px-0">
                                <v-btn icon class="mx-0" @click="editItemType(props.item)">
                                    <v-icon color="gray">edit</v-icon>
                                </v-btn>
                            </td>
                        </template>
                        <template slot="no-data">
                            <v-alert :value="true"  outline color="error" icon="warning">
                                Еще не создано ни одного типа тестирования
                            </v-alert>
                        </template>
                    </v-data-table>
                </div>
                <div>
                    <v-dialog v-model="dialogLevel" max-width="500px">
                        <v-btn slot="activator" color="primary" dark class="mb-2">Добавить Уровень</v-btn>
                        <v-card>
                            <v-card-title>
                                <span class="headline">{{ formTitleLevel }}</span>
                            </v-card-title>
                            <v-card-text>
                                <v-container grid-list-md>
                                    <v-layout wrap>
                                        <v-flex>
                                            <v-text-field v-model="editedItemLevel.name" label="Название"></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-container>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue" flat @click.native="closeLevel">Отмена</v-btn>
                                <v-btn color="blue" flat @click.native="saveLevel">Сохранить</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <v-data-table
                            :headers="typeHeader"
                            :items="levels"
                            class="elevation-8"
                    >
                        <template slot="items" slot-scope="props">
                            <td>{{ props.item.name }}</td>
                            <td class="layout px-0">
                                <v-btn icon class="mx-0" @click="editItemLevel(props.item)">
                                    <v-icon color="tgrayeal">edit</v-icon>
                                </v-btn>
                            </td>
                        </template>
                        <template slot="no-data">
                            <v-alert :value="true"  outline color="error" icon="warning">
                                Еще не создано ни одного уровня тестирования
                            </v-alert>
                        </template>
                    </v-data-table>
                </div>
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
            <div>
                <v-dialog v-model="dialog" max-width="500px">
                    <v-btn slot="activator" color="primary" dark class="mb-2">Добавить чеклист</v-btn>
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
                                                :label="`Активный чеклист`"
                                                v-model="editedItem.activeStatus"
                                        ></v-checkbox>
                                    </v-flex>
                                </v-layout>
                            </v-container>
                        </v-card-text>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn color="blue" flat @click.native="close">Отмена</v-btn>
                            <v-btn color="blue" flat @click.native="saveChecklist">Сохранить</v-btn>
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
                        :items="checklists"
                        :search="search"
                        pagination.sync
                        hide-actions
                        class="elevation-1"
                >
                    <template slot="items" slot-scope="props">
                        <td>{{ props.item.title }}</td>
                        <td>{{ props.item.activeStatus }}</td>
                        <td>{{ props.item.cDate }}</td>
                        <td class="layout px-0">
                            <v-btn icon class="mx-0" @click="editItem(props.item)">
                                <v-icon color="gray">edit</v-icon>
                            </v-btn>
                        </td>
                    </template>
                    <v-alert slot="no-results" :value="true"  outline color="error" icon="warning">
                        Поиск по запросу "{{ search }}" не дал результатов.
                    </v-alert>

                    <template slot="no-data">
                        <v-alert :value="true"  outline color="error" icon="warning">
                            Для получения списка чеклистов, выберите проект
                        </v-alert>
                    </template>
                </v-data-table>
            </div>

        </v-container>
            </v-content>
    </v-app>
</div>

<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data: () => ({
            drawer: true,
            mini: true,
            right: null,
            search: '',
            levels: [],
            typeHeader:[
                { text: 'Название', value: 'name' },
                { text: '', value: 'name', sortable: false }],
            types: [],
            projects:[],
            selectedProject: '',
            checklists: [],
            dialogType: false,
            dialogLevel: false,
            dialog: false,
            headers: [
                { text: 'Название', value: 'title' },
                { text: 'Статус', value: 'activeStatus' },
                { text: 'Дата создания', value: 'сDate'},
                { text: '', value: 'name', sortable: false }
            ],
            editedIndex: -1,
            editedIndexType: -1,
            editedIndexLevel: -1,
            editedItem: {
                title: '',
                activeStatus: ''
            },
            editedItemType: {
                name: ''
            },
            editedItemLevel: {
                name: '',
            },
            defaultItem: {
                title: '',
                activeStatus: '',
                name: ''
            },
        }),

        computed: {
            formTitle () {
                return this.editedIndex === -1 ? 'Добавить чеклист' : 'Редактировать чеклист'
            },
            formTitleType () {
                return this.editedIndexType === -1 ? 'Добавить тип' : 'Редактировать тип'
            },
            formTitleLevel () {
                return this.editedIndexLevel === -1 ? 'Добавить уровень' : 'Редактировать уровень'
            }
        },

        watch: {
            dialog (val) {
                val || this.close()
            },
            dialogType (val) {
                val || this.closeType()
            },
            dialogLevel (val) {
                val || this.closeLevel()
            },
            selectedProject: function () {
                axios.get('/tms/checklists?projectId='+this.selectedProject.id)
                    .then(response => {
                        this.checklists = response.data })
                    }
        },

        created () {
            axios.get('/tms/levels')
                .then(response => {
                    this.levels = response.data})
            axios.get('/tms/types')
                .then(response => {
                this.types = response.data})
            axios.get('/tms/projects')
                .then(response => {
                    this.projects = response.data })
        },

        methods: {
            editItem (item) {
                this.editedIndex = this.checklists.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
            },

            editItemType (item) {
                this.editedIndexType = this.types.indexOf(item)
                this.editedItemType = Object.assign({}, item)
                this.dialogType = true
            },

            editItemLevel (item) {
                this.editedIndexLevel = this.levels.indexOf(item)
                this.editedItemLevel = Object.assign({}, item)
                this.dialogLevel = true
            },


            close () {
                this.dialog = false
                setTimeout(() => {
                    this.editedItem = Object.assign({}, this.defaultItem)
                    this.editedIndex = -1
                }, 300)
            },

            closeLevel () {
                this.dialogLevel = false
                setTimeout(() => {
                    this.editedItemLevel = Object.assign({}, this.defaultItem)
                    this.editedIndexLevel = -1
                }, 300)
            },

            saveChecklist () {
                if (this.editedIndex > -1) {
                    Object.assign(this.checklists[this.editedIndex], this.editedItem)
                    axios({
                        method: 'POST',
                        url: '/tms/updateChecklist',
                        data: {
                            'title': this.editedItem.title,
                            'activeStatus': this.editedItem.activeStatus,
                            'id': this.editedItem.id,
                        }
                    }).then(function() {
                        console.log("done");});
                } else {
                    this.checklists.push(this.editedItem)
                    axios({
                        method: 'POST',
                        url: '/tms/addChecklist',
                        data: {
                            'title': this.editedItem.title,
                            'activeStatus': this.editedItem.activeStatus,
                            'fkProjectId': this.selectedProject.id
                        }
                    }).then(function() {
                        console.log("done");});
                }
                this.close()
            },

            closeType () {
                this.dialogType = false
                setTimeout(() => {
                    this.editedItemType = Object.assign({}, this.defaultItem)
                    this.editedIndexType = -1
                }, 300)
            },

            saveType () {
                if (this.editedIndexType > -1) {
                    Object.assign(this.types[this.editedIndexType], this.editedItemType)
                    axios({
                        method: 'POST',
                            url: '/tms/updateType',
                                data: {
                                    'name': this.editedItemType.name,
                                    'id': this.editedItemType.id
                                }
                    }).then(function() {
                        console.log("done");});
                } else {
                    this.types.push(this.editedItemType)
                    axios({
                        method: 'POST',
                        url: '/tms/addType',
                        data: {
                            'name': this.editedItemType.name,
                        }
                    }).then(function() {
                        console.log("done");});
                }
                this.closeType()
            },

            saveLevel () {
                if (this.editedIndexLevel > -1) {
                    Object.assign(this.levels[this.editedIndexLevel], this.editedItemLevel)
                    axios({
                        method: 'POST',
                            url: '/tms/updateLevel',
                                data: {
                                    'name': this.editedItemLevel.name,
                                    'id': this.editedItemLevel.id
                                }
                    }).then(function() {
                        console.log("done");});
                } else {
                    this.levels.push(this.editedItemLevel)
                    axios({
                        method: 'POST',
                        url: '/tms/addLevel',
                        data: {
                            'name': this.editedItemLevel.name,
                        }
                    }).then(function() {
                        console.log("done");});
                }
                this.closeLevel()
            },
        }
    })
</script>
</body>
</html>