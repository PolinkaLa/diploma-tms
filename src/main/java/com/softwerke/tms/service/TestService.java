package com.softwerke.tms.service;

import com.softwerke.tms.dao.model.Test;

import java.util.List;

public interface TestService {
    List<Test> getAll();

    void save(Test test);

    Test getOne(int id);
}
