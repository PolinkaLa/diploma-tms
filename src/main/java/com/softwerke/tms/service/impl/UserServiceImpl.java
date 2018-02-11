package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.UserDAO;
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
    public void insertUser(User user) {}

    @Override
    public User getUser(int testID) {
        return null;
    }

    @Override
    public List<User> getUsers() {
        return userDAO.getUsers();
    }

    @Override
    public void updateUser(User User) {}
}
