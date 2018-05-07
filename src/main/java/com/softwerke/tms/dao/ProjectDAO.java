package com.softwerke.tms.dao;

import com.softwerke.tms.repository.Project;

import java.util.List;

public interface ProjectDAO {

    void insertProject(String name, boolean status);

    Project getProject(int projectID);

    List<Project> getProjects();

    void updateProject(Project project)  throws Exception;
}