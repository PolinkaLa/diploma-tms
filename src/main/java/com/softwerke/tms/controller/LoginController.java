package com.softwerke.tms.controller;

import com.softwerke.tms.model.Credential;
import com.softwerke.tms.security.AuthorizationManager;
import com.softwerke.tms.service.LdapService;
import com.softwerke.tms.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginController {

    public static final String GUEST_REFERER_ATTRIBUTE = "from";

    @Autowired
    private LdapService ldapService;

    @Autowired
    UserService userService;

    @GetMapping(value = "/login")
    public Object loginView(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String from = StringUtils.defaultIfBlank(
                (String) request.getSession(true).getAttribute(GUEST_REFERER_ATTRIBUTE), "/"
        );

        if (request.getSession().getAttribute(AuthorizationManager.USER_SESSION_ATTRIBUTE) != null) {
            response.sendRedirect("/logout");
            return null;
        } else {
            return new ModelAndView("login").addObject("from", from);
        }
    }

    @PostMapping(value = "/login")
    public void handleLoginPost(@RequestParam String login,
                                @RequestParam String password,
                                @RequestParam(required = false) String from,
                                HttpServletRequest request,
                                HttpServletResponse response) throws IOException, ServletException, Exception{

        Credential credential = ldapService.authorizeUser(login, password);
        //User user = new User(credential.getLogin());
        //userService.insertUser(credential.getName());
        if (credential == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            request.getRequestDispatcher("/error").forward(request, response);
            return;
        }
        if (!userService.isUserExist(credential.getLogin())) {
            userService.insertUser(credential.getLogin());
        }
        credential.setId(userService.getUser(credential.getLogin()).getId());

        request.getSession().setAttribute(AuthorizationManager.USER_SESSION_ATTRIBUTE, credential);
        response.sendRedirect(StringUtils.defaultIfBlank(from, "/"));
    }

    @GetMapping(value = "/logout")
    public Object logoutView(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getSession().getAttribute(AuthorizationManager.USER_SESSION_ATTRIBUTE) == null) {
            response.sendRedirect("/login");
            return null;
        } else {
            return new ModelAndView("login");
        }
    }

    @PostMapping(value = "/logout")
    public void handleLogoutPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("/");
    }
}
