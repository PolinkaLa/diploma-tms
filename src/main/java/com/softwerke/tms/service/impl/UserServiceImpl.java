package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.UserDAO;
import com.softwerke.tms.model.Credential;
import com.softwerke.tms.model.User;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDAO userDAO;

    @Override
    public void insertUser(String name) {
        userDAO.insertUser(name);
    }

    @Override
    public User getUser(String login)  throws Exception{
        return userDAO.getUser(login);
    }

    @Override
    public List<User> getUsers() {
        return userDAO.getUsers();
    }

    @Override
    public void updateUser(User User) {
        // TODO
    }

    public boolean isUserExist(String login)  throws Exception{
        return userDAO.isUserExist(login);
    }
}
