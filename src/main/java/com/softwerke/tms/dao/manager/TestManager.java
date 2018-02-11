package com.softwerke.tms.dao.manager;

import com.softwerke.tms.model.Test;

import java.util.List;

public interface TestManager {
    void insertTest(Test test);

    Test getTest(int testID);

    List<Test> getTests();
}
