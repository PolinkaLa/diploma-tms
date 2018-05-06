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
            <div>
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
                        hide-actions
                        class="elevation-1"
                >
                    <template slot="items" slot-scope="props">
                        <td>{{ props.item.login }}</td>
                        <td>{{ props.item.name }}</td>
                        <td>{{ props.item.email }}</td>
                        <td><v-edit-dialog
                                :return-value.sync="props.item.role"
                                lazy
                        ><div>{{ props.item.roleName }}</div>
                            <v-select
                                    :items="roles"
                                    slot="input"
                                    v-model="props.item.role"
                                    :hint="`${props.item.role.name}, ${props.item.role.id}`"
                                    single-line
                                    item-text="name"
                                    item-value="id"
                                    return-object
                                    autofocus
                            ></v-select>
                        </v-edit-dialog></td>
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
            search: '',
            users:[],
            roles: [],
            selectedRole: '',
            dialog: false,
            headers: [
                { text: 'Логин', value: 'login' },
                { text: 'Имя', value: 'name' },
                { text: 'email', value: 'email' },
                { text: 'Pоль', value: 'roleName' }
            ],
        }),

        computed: {
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
                } else {
                    this.tests.push(this.editedItem)
                }
                this.close()
            },
        }
    })
</script>
</body>
</html>