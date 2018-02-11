package com.softwerke.tms.dao;

import com.softwerke.tms.model.User;

import java.util.List;

public interface UserDAO {

    void insertUser(User user);

    User getUser(int testID);

    List<User> getUsers();

    void updateUser (User User);
}
