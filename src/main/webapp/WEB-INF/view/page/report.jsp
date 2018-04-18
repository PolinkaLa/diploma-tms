<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<html>

<head>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.2.2/lib/theme-chalk/index.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        .report-name{
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
<script src="https://rawgit.com/vuejs/vue/dev/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.2.2/lib/index.js"></script>
<script src="https://unpkg.com/element-ui/lib/umd/locale/en.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="https://unpkg.com/vue-chartjs/dist/vue-chartjs.min.js"></script>
<%@include file="fragment/header.jsp" %>
<script>
    var Main = {
        data() {
            return {
                activeIndex: '6',
                activeIndex2: '6',
            };
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            }
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#menu')
</script>
<div id="app">
    <div class="report-name">
        <el-tag type="info">Test group by Users</el-tag></div>
    <line-chart></line-chart>
</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    ELEMENT.locale(ELEMENT.lang.en);
Vue.component('line-chart', {
  extends: VueChartJs.Pie,
  mounted () {
    this.renderChart({
        labels: ['TMS Project', 'Test Project', 'AEM Project', 'Vacation planer',],
        datasets: [
            {
                backgroundColor: ['rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'],
                data: [10, 5, 8, 3]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  },
    created() {
        axios.get('/tms/testGroupByUsers')
            .then(response => {
                this.datasets.data = response.data })
    },

})

var vm = new Vue({
  el: '#app',
  data: {
    message: 'Hello World'
  }
})
</script>
</body>

</html>