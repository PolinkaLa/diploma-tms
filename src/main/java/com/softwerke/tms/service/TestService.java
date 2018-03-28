package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;

import java.util.List;

public interface TestService {
    void insertTest(int checklist, int user, int type, int level, String title, String description);

    Test getTest(int testID);

    List<Test> getTests(int checklistId);

    void updateTest(Test test);
}
