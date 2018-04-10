package com.softwerke.tms.dao;

import com.softwerke.tms.model.Test;

import java.util.List;

public interface TestDAO {
    void insertTest(int checklist, int user, int type, int level, String title, String description);

    Test getTest(int testID);

    List<Test> getTests(int checklistId);

    void updateTest (Test test);

    void delTest(int id);

    boolean isTestExist(int id) throws Exception;
}
