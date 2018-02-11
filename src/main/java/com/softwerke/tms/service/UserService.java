package com.softwerke.tms.service;

import com.softwerke.tms.model.User;

import java.util.List;

public interface UserService {
    List<User> getAll();

    void save(String login);

    User getOne(int id);
}
