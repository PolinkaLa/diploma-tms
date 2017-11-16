package com.softwerke.tms.web.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class SecurityFilter implements Filter {

    private static List<String> allowedPathPrefixes = new ArrayList<>();

    static {
        allowedPathPrefixes.add("/error");
        allowedPathPrefixes.add("/login");
        allowedPathPrefixes.add("/logout");
        allowedPathPrefixes.add("/resources/");
    }

    @Autowired
    private AuthorizationManager authorizationManager;

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(true);

        for (String allowedPathPrefix : allowedPathPrefixes) {
            if (request.getServletPath().startsWith(allowedPathPrefix)) {

                chain.doFilter(req, resp);
                return;
            }
        }

        if (authorizationManager.authorize(request) == null) {

            session.setAttribute(LoginController.GUEST_REFERER_ATTRIBUTE, request.getRequestURI());
            response.sendRedirect("/login");
            return;
        }

        chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
