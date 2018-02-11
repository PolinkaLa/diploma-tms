package com.softwerke.tms.dao.manager.impl;

import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.dao.manager.TestManager;
import com.softwerke.tms.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TestManagerImpl implements TestManager {

    @Autowired
    private TestDAO testDAO;

    @Override
    public void insertTest(Test test) {
    }

    @Override
    @Transactional
    public Test getTest(int testID) {
        return testDAO.getTest(testID);
    }

    @Override
    public List<Test> getTests() {
        return testDAO.getTests();
    }
}
