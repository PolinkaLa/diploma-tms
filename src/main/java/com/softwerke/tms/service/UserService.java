package com.softwerke.tms.service;

import com.softwerke.tms.dao.model.User;

import java.util.List;

public interface UserService {
    List<User> getAll();

    void save(String login);

    User getOne(int id);
}
