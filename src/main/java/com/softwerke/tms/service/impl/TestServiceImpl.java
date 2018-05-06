package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.LevelDAO;
import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.dao.TypeDAO;
import com.softwerke.tms.dao.UserDAO;
import com.softwerke.tms.repository.User;
import com.softwerke.tms.service.LdapService;
import com.softwerke.tms.service.TestService;
import com.softwerke.tms.repository.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDAO testDAO;
    @Autowired
    private LevelDAO levelDAO;
    @Autowired
    private TypeDAO typeDAO;
    @Autowired
    private LdapService ldapService;
    @Autowired
    private UserDAO userDAO;

    @Override
    public void insertTest(int checklist, int user, int type, int level, String title, String description) {
        testDAO.insertTest(checklist, user, type, level, title, description, null);
    }

    @Override
    public Test getTest(int testID) throws Exception {
        return testDAO.getTest(testID);
    }

    @Override
    public List<Test> getTests(int checklistId) throws Exception {
        List<Test> tests = testDAO.getTests(checklistId);
            for (Test test : tests) {
                test.setLevel(levelDAO.getLevelName(test.getFkLevelId()));
                test.setType(typeDAO.getTypeName(test.getFkTypeId()));
                User user = userDAO.getUserByID(test.getFkUserId());
                String login = user.getPrincipalName();
                String name = ldapService.getUserData(login)[0];
                name = name.split("= ")[1];
                test.setUser(name);
                SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
                String date = dateFormat.format(test.getCreatedDate());
                test.setcDate(date);
                date = dateFormat.format(test.getUpdatedDate());
                test.setuDate(date);
            }
        return tests;
    }

    @Override
    public void updateTest(Test test) {
        testDAO.updateTest(test);
    }


}
