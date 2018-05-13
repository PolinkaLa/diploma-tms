<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<v-navigation-drawer v-model="drawer" stateless hide-overlay clipped temporary app>
    <v-toolbar flat class="transparent">
        <v-list class="pa-0">
            <v-list-tile avatar>
                    <v-avatar color="blue" :size=60>
                        <span class="white--text headline">${sessionScope.user.login}</span>
                    </v-avatar>
            <v-list-tile-content>
                <v-list-tile-title><span>${sessionScope.user.name}</span></v-list-tile-title>
            </v-list-tile-content>
            </v-list-tile>
        </v-list>
    </v-toolbar>
    <v-list class="pt-0" dense>
        <v-divider></v-divider>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>view_quilt</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_test"/>" style="text-decoration: none;">Управление
                    тестами</a></v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>slideshow</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_run"/>" style="text-decoration: none;">Прогоны</a>
                </v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>save_alt</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_import"/>" style="text-decoration: none;">Импорт</a>
                </v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>note_add</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_checklist"/>" style="text-decoration: none;">Управление чеклистами</a>
                </v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>computer</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_project"/>" style="text-decoration: none;">Управление
                    проектами</a></v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>people</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_user"/>" style="text-decoration: none;">Управление
                    пользователями</a></v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>pie_chart</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/demo_report"/>" style="text-decoration: none;">Отчеты</a>
                </v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="">
            <v-list-tile-action>
                <v-icon>exit_to_app</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
                <v-list-tile-title><a href="<c:url value="/logout"/>" style="text-decoration: none;">Выход</a>
                </v-list-tile-title>
            </v-list-tile-content>
        </v-list-tile>
    </v-list>
</v-navigation-drawer>