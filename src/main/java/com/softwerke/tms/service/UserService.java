package com.softwerke.tms.service;

import com.softwerke.tms.model.User;

import java.util.List;

public interface UserService {
    void insertUser(User user);

    User getUser(int testID);

    List<User> getUsers();

    void updateUser (User User);
}
