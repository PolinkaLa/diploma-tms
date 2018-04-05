package com.softwerke.tms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PagesController {
    @RequestMapping("/testpage")
    public ModelAndView testPageView() {
        ModelAndView modelAndView = new ModelAndView("page/tests");
        modelAndView.addObject("view", "page/tests");
        modelAndView.addObject("title", "Tests Page");
        return modelAndView;
    }

    @RequestMapping("/userpage")
    public ModelAndView userPageView() {
        ModelAndView modelAndView = new ModelAndView("page/users");
        modelAndView.addObject("view", "page/users");
        modelAndView.addObject("title", "Users Page");
        return modelAndView;
    }

    @RequestMapping("/projectpage")
    public ModelAndView projectPageView() {
        ModelAndView modelAndView = new ModelAndView("page/projects");
        modelAndView.addObject("view", "page/projects");
        modelAndView.addObject("title", "Progects Page");
        return modelAndView;
    }

    @RequestMapping("/import")
    public ModelAndView importPageView() {
        ModelAndView modelAndView = new ModelAndView("page/import");
        modelAndView.addObject("view", "page/import");
        modelAndView.addObject("title", "Progects Page");
        return modelAndView;
    }
}
