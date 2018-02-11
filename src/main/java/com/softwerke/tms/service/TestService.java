package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;

import java.util.Set;

public interface TestService {
    Set<Test> getAll();

    void save(Test test);

    Test getOne(int id);
}
