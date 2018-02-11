package com.softwerke.tms.dao;

import com.softwerke.tms.model.Test;

import java.util.List;

public interface TestDAO {
    void insertTest(Test test);

    Test getTest(int testID);

    List<Test> getTests();
}
