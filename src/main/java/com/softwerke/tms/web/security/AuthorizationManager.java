package com.softwerke.tms.web.security;

import com.softwerke.tms.dao.jdbc.UserDAO;
import com.softwerke.tms.dao.model.User;
import com.softwerke.tms.service.LdapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.annotation.Nullable;
import javax.servlet.http.HttpServletRequest;

@Component
public class AuthorizationManager {

    public static final String USER_SESSION_ATTRIBUTE = "user";

    private static final String AUTHORIZATION_HEADER = "Authorization";
    private static final String CREDENTIALS_SEPARATOR = ":";

    @Autowired
    private LdapService ldapService;


    @Nullable
    public User authorize(HttpServletRequest request) {

        String authorizationHeader = request.getHeader(AUTHORIZATION_HEADER);
        if (authorizationHeader == null) {
            return (User) request.getSession(true).getAttribute(USER_SESSION_ATTRIBUTE);
        }

        int separatorIndex = authorizationHeader.indexOf(CREDENTIALS_SEPARATOR);
        if (separatorIndex == -1) {
            return null;
        }

        String login = authorizationHeader.substring(0, separatorIndex).trim();
        String password = authorizationHeader.substring(separatorIndex + 1).trim();

        User user = ldapService.authorizeUser(login, password);
//        userDAO.save(user);
        request.getSession(true).setAttribute(USER_SESSION_ATTRIBUTE, user);


        return user;
    }
}
