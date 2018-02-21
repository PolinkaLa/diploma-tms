package com.softwerke.tms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestsPageController {
    @RequestMapping("/testpage")
    public ModelAndView handleIssuesView() {
        ModelAndView modelAndView = new ModelAndView("page/tests");
        modelAndView.addObject("view", "page/tests");
        modelAndView.addObject("title", "Test Page");

        return modelAndView;
    }
}
