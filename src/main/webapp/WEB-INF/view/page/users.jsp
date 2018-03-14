<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>
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
        <v-data-table
                :headers="headers"
                :items="items"
                :search="search"
        >
            <template slot="items" slot-scope="props">
                <td>{{ props.item.login }}</td>
                <td>{{ props.item.name }}</td>
                <td>{{ props.item.email }}</td>
                <td >
                    <v-edit-dialog
                            :return-value.sync="props.item.role"
                            large
                            lazy
                            persistent
                    >
                        <div>{{ props.item.role }}</div>
                        <div slot="input" class="mt-3 title">Update Role</div>
                        <v-text-field
                                slot="input"
                                label="Edit"
                                v-model="props.item.role"
                                single-line
                                counter
                                autofocus
                                :rules="[max25chars]"
                        ></v-text-field>
                    </v-edit-dialog>
                </td>
            </template>
            <template slot="pageText" slot-scope="{ pageStart, pageStop }">
                From {{ pageStart }} to {{ pageStop }}
            </template>
        </v-data-table>
            </v-card>
    </v-app>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/vuetify/dist/vuetify.js"></script>
    <script>
        new Vue({
            el: '#app',
            data () {
                return {
                    max25chars: (v) => v.length <= 25 || 'Input too long!',
                    pagination: {},
                    search: '',
                    headers: [
                        {text: 'Login', value: 'login'},
                        {text: 'Name', value: 'name'},
                        {text: 'Email', value: 'email'},
                        {text: 'Role', value: 'role'}
                    ],
                    items: [
                        {
                            login: 'lpv',
                            name: 'Polina Lappo',
                            email: 'polina.lappo@soft-werke.com',
                            role: 'admin'
                        },
                        {
                            login: 'lpv',
                            name: 'Polina Lappo',
                            email: 'polina.lappo@soft-werke.com',
                            role: 'admin'
                        },
                        {
                            login: 'lpv',
                            name: 'Polina Lappo',
                            email: 'polina.lappo@soft-werke.com',
                            role: 'admin'
                        }
                    ]
                }
            }
        })
    </script>
</div>
</body>
</html>
