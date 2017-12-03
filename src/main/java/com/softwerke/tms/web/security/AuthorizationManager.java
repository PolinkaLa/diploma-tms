package com.softwerke.tms.web.security;

import com.softwerke.tms.entity.Credential;
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
    public Credential authorize(HttpServletRequest request) {

        String authorizationHeader = request.getHeader(AUTHORIZATION_HEADER);
        if (authorizationHeader == null) {
            return (Credential) request.getSession(true).getAttribute(USER_SESSION_ATTRIBUTE);
        }

        int separatorIndex = authorizationHeader.indexOf(CREDENTIALS_SEPARATOR);
        if (separatorIndex == -1) {
            return null;
        }

        String login = authorizationHeader.substring(0, separatorIndex).trim();
        String password = authorizationHeader.substring(separatorIndex + 1).trim();

        Credential credential = ldapService.authorizeUser(login, password);
        request.getSession(true).setAttribute(USER_SESSION_ATTRIBUTE, credential);

        return credential;
    }
}
