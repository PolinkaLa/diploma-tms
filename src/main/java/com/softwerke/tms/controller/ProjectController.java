package com.softwerke.tms.controller;

import com.softwerke.tms.repository.Project;
import com.softwerke.tms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @RequestMapping("/activeProjects")
    public List<Project> getActiveProjects () {
        List<Project> projects = projectService.getActiveProjects();
        return projects;
    }
    @PostMapping(value = "/addProject")
    public void addProject(@RequestBody Project project){
        String name = project.getTitle();
        boolean status = project.isActiveStatus();
        projectService.insertProject(name, status);
    }

    @PostMapping(value = "/updateProject")
    public void updateProject(@RequestBody Project project) throws Exception{
        projectService.updateProject(project);
    }
}
