package com.softwerke.tms.service.impl;

import com.softwerke.tms.model.User;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public void save(String login) {
    }

    @Override
    public User getOne(int id) {
        return null;
    }
}
