package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.ProjectDAO;
import com.softwerke.tms.repository.Project;
import com.softwerke.tms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDAO projectDAO;

    @Override
    public void insertProject(String name, boolean status) {
        projectDAO.insertProject(name, status);
    }

    @Override
    public Project getProject(int projectID) {
        // TODO
        return null;
    }

    @Override
    public List<Project> getProjects() {
        List<Project> projects = projectDAO.getProjects();
        for (Project project : projects) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            String date = dateFormat.format(project.getCreatedDate());
            project.setcDate(date);
        }
        return projects;
    }

    @Override
    public void updateProject(Project project)  throws Exception {
        projectDAO.updateProject(project);
    }
}
