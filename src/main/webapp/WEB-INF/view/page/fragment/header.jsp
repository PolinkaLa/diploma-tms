<div>
    <nav>
        <div>
            <ul>
                <li><a href="<c:url value="/tests"/>">Tests</a></li>
                <li><a href="<c:url value="/users"/>">Users</a></li>
            </ul>
            <ul>
                <li><a href="#">${sessionScope.user.login}</a></li>
                <li><a href="#">${sessionScope.user.name}</a></li>
                <li><a href="#">${sessionScope.user.email}</a></li>
                <li><a href="<c:url value="/logout"/>">logout</a></li>
            </ul>
        </div>
    </nav>
</div>