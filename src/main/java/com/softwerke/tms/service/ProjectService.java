package com.softwerke.tms.service;

import com.softwerke.tms.model.Project;

import java.util.List;

public interface ProjectService {
    void insertProject(Project project);

    Project getProject(int projectID);

    List<Project> getProjects();

    void updateProject(Project project);
}
