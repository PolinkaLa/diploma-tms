package com.softwerke.tms.service;

import com.softwerke.tms.dao.model.Project;

import java.util.List;

public interface ProjectService {
    List<Project> getAll();

    void save(Project project);

    Project getOne(int id);
}
