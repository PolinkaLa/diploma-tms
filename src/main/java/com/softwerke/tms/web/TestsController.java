package com.softwerke.tms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestsController {

    @RequestMapping("tests")
    public ModelAndView handleIssuesView() {
        ModelAndView modelAndView = new ModelAndView("page/tests");
        modelAndView.addObject("view", "page/tests");
        modelAndView.addObject("title", "Tests Page");

        return modelAndView;
    }
}
