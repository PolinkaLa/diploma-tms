<div>
    <nav>
        <div>
            <ul>
                <li><a href="<c:url value="/testpage"/>">Tests</a></li>
                <li><a href="<c:url value="/userpage"/>">Users</a></li>
                <li><a href="<c:url value="/projectpage"/>">Projects</a></li>
            </ul>
            <ul>
                <li>${sessionScope.user.name}</li>
                <li><a href="<c:url value="/logout"/>">logout</a></li>
            </ul>
        </div>
    </nav>
</div>