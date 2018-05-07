package com.softwerke.tms.service;

import com.softwerke.tms.repository.Project;

import java.util.List;

public interface ProjectService {
    void insertProject(String name, boolean status);

    Project getProject(int projectID);

    List<Project> getProjects();

    void updateProject(Project project)  throws Exception;
}
