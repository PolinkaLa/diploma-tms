package com.softwerke.tms.controller;

import com.softwerke.tms.model.Project;
import com.softwerke.tms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping("/projects")
    public List<Project> getAllProjects () {
        List<Project> projects = projectService.getProjects();
        return projects;
    }
}
