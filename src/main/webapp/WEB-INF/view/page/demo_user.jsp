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
                            <v-card>
                                <v-card-title>
                                    <span class="headline">{{ formTitle }}</span>
                                </v-card-title>
                                <v-card-text>
                                    <v-container grid-list-md>
                                        <v-layout wrap>
                                            <v-flex>
                                                <v-text-field v-model="editedItem.login" label="Логин" disabled></v-text-field>
                                            </v-flex>
                                        </v-layout>
                                        </v-layout>
                                            <v-layout wrap>
                                            <v-flex>
                                                <v-text-field v-model="editedItem.name" label="Имя" disabled></v-text-field>
                                            </v-flex>
                                        </v-layout>
                                        <v-layout wrap>
                                             <v-flex>
                                                <v-text-field v-model="editedItem.email" label="email" disabled></v-text-field>
                                             </v-flex>
                                        </v-layout>
                                        <v-layout wrap>
                                        <v-flex>
                                            <v-select
                                                :items="roles"
                                                v-model="editedItem.roleName"
                                                :hint="`${selectedRole.name}, ${selectedRole.id}`"
                                                label="Роль"
                                                single-line
                                                item-text="name"
                                                item-value="id"
                                                return-object
                                                persistent-hint
                                            ></v-select>
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
                        :items="users"
                        :search="search"
                        class="elevation-8"
                >
                    <template slot="items" slot-scope="props">
                        <td>{{ props.item.login }}</td>
                        <td>{{ props.item.name }}</td>
                        <td>{{ props.item.email }}</td>
                        <td>{{ props.item.roleName }}</td>
                        <td class="layout px-0">
                                                <v-btn icon class="mx-0" @click="editItem(props.item)">
                                                    <v-icon color="teal">edit</v-icon>
                                                </v-btn>
                                            </td>
                    </template>
                    <v-alert slot="no-results" :value="true"  outline color="error" icon="warning">
                        Поиск по запросу "{{ search }}" не дал результатов.
                    </v-alert>

                    <template slot="no-data">
                        <v-alert :value="true"  outline color="error" icon="warning">
                            В базе данных нет сведений о пользователях системы
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
<script>
    new Vue({
        el: '#app',
        data: () => ({
            search: '',
            users:[],
            roles: [],
            selectedRole: '',
            dialog: false,
            headers: [
                { text: 'Логин', value: 'login' },
                { text: 'Имя', value: 'name' },
                { text: 'email', value: 'email' },
                { text: 'Pоль', value: 'roleName' },
                { text: '', value: 'act', sortable: false }
            ],
             editedIndex: -1,
             editedItem: {
                login: '',
                name: '',
                email: 0,
                roleName: 0
             },
        }),

        computed: {
        formTitle () {
                        return this.editedIndex === -1 ? 'Добавить тест-кейс' : 'Редактирование прав доступа'
                    }
        },

        watch: {
            dialog (val) {
                val || this.close()
            }
        },

        created () {
            axios.get('/tms/users')
                .then(response => {
                    this.users = response.data })
            axios.get('/tms/roles')
                .then(response => {
                    this.roles = response.data })
        },

        methods: {

            editItem (item) {
                this.editedIndex = this.users.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
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
                    Object.assign(this.users[this.editedIndex], this.editedItem)
                    axios({
                        method: 'POST',
                        url: '/tms/updateUser',
                        data: {
                            'fkRoleId': this.editedItem.roleName.id,
                            'id': this.editedItem.id
                        }
                    }).then(function () {
                        console.log("done");
                    });
                }
                else {}
                this.close()
            },
        }
    })
</script>
</body>
</html>