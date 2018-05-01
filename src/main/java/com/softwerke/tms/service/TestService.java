package com.softwerke.tms.service;

import com.softwerke.tms.repository.Test;

import java.util.List;

public interface TestService {
    void insertTest(int checklist, int user, int type, int level, String title, String description);

    Test getTest(int testID) throws Exception;

    List<Test> getTests(int checklistId) throws Exception;

    void updateTest(Test test);
}
