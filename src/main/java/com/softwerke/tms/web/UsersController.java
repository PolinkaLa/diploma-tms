package com.softwerke.tms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController {

    @RequestMapping("users")
    public ModelAndView handleIssuesView() {
        ModelAndView modelAndView = new ModelAndView("page/users");
        modelAndView.addObject("view", "page/users");
        modelAndView.addObject("title", "Users Page");

        return modelAndView;
    }
}
