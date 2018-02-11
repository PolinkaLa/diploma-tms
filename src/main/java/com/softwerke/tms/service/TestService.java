package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;

import java.util.List;

public interface TestService {
    void insertTest(Test test);

    Test getTest(int testID);

    List<Test> getTests();

    void updateTest(Test test);
}
