package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.ProjectDAO;
import com.softwerke.tms.model.Project;
import com.softwerke.tms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDAO projectDAO;

    @Override
    public void insertProject(Project project) {

    }

    @Override
    public Project getProject(int projectID) {
        return null;
    }

    @Override
    public List<Project> getProjects() {
        return projectDAO.getProjects();
    }

    @Override
    public void updateProject(Project project) {

    }
}
