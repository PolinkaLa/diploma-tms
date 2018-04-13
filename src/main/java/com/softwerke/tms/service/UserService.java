package com.softwerke.tms.service;

import com.softwerke.tms.model.Credential;
import com.softwerke.tms.model.User;

import java.util.List;

public interface UserService {
    void insertUser(String name);

    User getUser(String login) throws Exception;

    List<User> getUsers();

    void updateUser (User User);

    boolean isUserExist(String login) throws Exception;

    List<Credential> getUsersData () throws Exception;
}
