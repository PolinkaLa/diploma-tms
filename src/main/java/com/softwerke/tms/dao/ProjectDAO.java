package com.softwerke.tms.dao;

import com.softwerke.tms.model.Project;

import java.util.List;

public interface ProjectDAO {

    void insertProject(Project project);

    Project getProject(int projectID);

    List<Project> getProjects();

    void updateProject(Project project);
}