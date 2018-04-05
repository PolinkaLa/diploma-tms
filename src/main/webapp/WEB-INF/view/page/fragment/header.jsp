<style>
    a {
        text-decoration: none;
    }
</style>
<div id="menu"><el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
    <el-menu-item index="1"><a href="<c:url value="/testpage"/>">Tests</a></el-menu-item>
    <el-menu-item index="2"><a href="<c:url value="/import"/>">Import</a></el-menu-item>
    <el-menu-item index="3"><a href="<c:url value="/userpage"/>">Users</a></el-menu-item>
    <el-menu-item index="4"><a href="<c:url value="/projectpage"/>">Projects</a></el-menu-item>
</el-menu>
    <el-tag>${sessionScope.user.name}</el-tag>
    <a href="<c:url value="/logout"/>"><span class="el-icon-close"></span></a>
</div>
