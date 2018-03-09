package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.service.TestService;
import com.softwerke.tms.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDAO testDAO;

    @Override
    public void insertTest(int checklist, int user, int type, int level, String title, String description) {
        testDAO.insertTest(checklist, user, type, level, title, description);
    }

    @Override
    public Test getTest(int testID) {
        return testDAO.getTest(testID);
    }

    @Override
    public List<Test> getTests() {
        return testDAO.getTests();
    }

    @Override
    public void updateTest(Test test) {
        // TODO
    }


}
