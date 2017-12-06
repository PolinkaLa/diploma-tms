package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.jdbc.UserDAO;
import com.softwerke.tms.dao.model.User;
import com.softwerke.tms.service.UserService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    @Override
    public List<User> getAll() {
        return userDAO.getAll();
    }

    @Override
    public void save(String login) {
        userDAO.save(login);
    }

    @Override
    public User getOne(int id) {
        return null;
    }
}
