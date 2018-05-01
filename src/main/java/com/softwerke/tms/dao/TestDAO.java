package com.softwerke.tms.dao;

import com.softwerke.tms.repository.Test;

import java.util.List;

public interface TestDAO {
    void insertTest(int checklist, int user, int type, int level, String title, String description, String file);

    Test getTest(int testID) throws Exception;

    List<Test> getTests(int checklistId);

    void updateTest (Test test);

    void delTest(int id);

    boolean isTestExist(int id) throws Exception;

    int getChecklistOfTest(int id)throws Exception;

    void insertTestFromFile(Test test) throws Exception;

    void copyTest(Test test) throws Exception;
}
