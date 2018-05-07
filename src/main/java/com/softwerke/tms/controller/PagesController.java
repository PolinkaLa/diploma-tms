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

    @RequestMapping("/importpage")
    public ModelAndView importPageView() {
        ModelAndView modelAndView = new ModelAndView("page/import");
        modelAndView.addObject("view", "page/import");
        modelAndView.addObject("title", "Import Page");
        return modelAndView;
    }

    @RequestMapping("/managepage")
    public ModelAndView managePageView() {
        ModelAndView modelAndView = new ModelAndView("page/manage");
        modelAndView.addObject("view", "page/manage");
        modelAndView.addObject("title", "Manage Page");
        return modelAndView;
    }
    @RequestMapping("/reportpage")
    public ModelAndView reportPageView() {
        ModelAndView modelAndView = new ModelAndView("page/report");
        modelAndView.addObject("view", "page/report");
        modelAndView.addObject("title", "Report Page");
        return modelAndView;
    }
    @RequestMapping("/runpage")
    public ModelAndView runPageView() {
        ModelAndView modelAndView = new ModelAndView("page/run");
        modelAndView.addObject("view", "page/run");
        modelAndView.addObject("title", "Run Page");
        return modelAndView;
    }
    @RequestMapping("/demo_test")
    public ModelAndView demoTestPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_test");
        modelAndView.addObject("view", "page/demo_test");
        modelAndView.addObject("title", "test");
        return modelAndView;
    }
    @RequestMapping("/demo_user")
    public ModelAndView demoUserPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_user");
        modelAndView.addObject("view", "page/demo_user");
        modelAndView.addObject("title", "user");
        return modelAndView;
    }
    @RequestMapping("/demo_checklist")
    public ModelAndView demoChecklistPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_checklist");
        modelAndView.addObject("view", "page/demo_checklist");
        modelAndView.addObject("title", "checklist");
        return modelAndView;
    }
    @RequestMapping("/demo_import")
    public ModelAndView demoImportPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_import");
        modelAndView.addObject("view", "page/demo_import");
        modelAndView.addObject("title", "import");
        return modelAndView;
    }
    @RequestMapping("/demo_project")
    public ModelAndView demoProjectPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_project");
        modelAndView.addObject("view", "page/demo_project");
        modelAndView.addObject("title", "project");
        return modelAndView;
    }
    @RequestMapping("/demo_report")
    public ModelAndView demoReportPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_report");
        modelAndView.addObject("view", "page/demo_report");
        modelAndView.addObject("title", "report");
        return modelAndView;
    }
    @RequestMapping("/demo_run")
    public ModelAndView demoRunPageView() {
        ModelAndView modelAndView = new ModelAndView("page/demo_run");
        modelAndView.addObject("view", "page/demo_run");
        modelAndView.addObject("title", "run");
        return modelAndView;
    }
}
