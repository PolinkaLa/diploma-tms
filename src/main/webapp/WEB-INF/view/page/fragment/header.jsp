<style>
    a {
        text-decoration: none;
    }
    .el-table__empty-block {
        height: 0%;
    }

</style>
<div id="menu"><div>
<el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
    <el-menu-item index="1"><a href="<c:url value="/testpage"/>">Tests</a></el-menu-item>
    <el-menu-item index="2"><a href="<c:url value="/importpage"/>">Import</a></el-menu-item>
    <el-menu-item index="3"><a href="<c:url value="/userpage"/>">Users</a></el-menu-item>
    <el-menu-item index="4"><a href="<c:url value="/projectpage"/>">Projects</a></el-menu-item>
    <el-menu-item index="5"><a href="<c:url value="/managepage"/>">Manage</a></el-menu-item>
    <el-menu-item index="6"><a href="<c:url value="/reportpage"/>">Report</a></el-menu-item>
    <el-menu-item index="7"><a href="<c:url value="/runpage"/>">Run</a></el-menu-item>
</el-menu></div>
<div>
        <el-tag>${sessionScope.user.name}</el-tag>
        <a href="<c:url value="/logout"/>"><span class="el-icon-close"></span></a>
    </div>
</div>
