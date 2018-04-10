<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<html>

<head>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.2.2/lib/theme-chalk/index.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <line-chart></line-chart>
</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    ELEMENT.locale(ELEMENT.lang.en);
Vue.component('line-chart', {
  extends: VueChartJs.Line,
  mounted () {
    this.renderChart({
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label: 'Data One',
          backgroundColor: '#f87979',
          data: [40, 39, 10, 40, 39, 80, 40]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }

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