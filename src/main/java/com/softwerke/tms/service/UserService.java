package com.softwerke.tms.service;

import com.softwerke.tms.repository.Credential;
import com.softwerke.tms.repository.User;

import java.util.List;

public interface UserService {
    void insertUser(String name);

    User getUser(String login) throws Exception;
    User getUserByID(int id);

    List<User> getUsers();

    void updateUser (User User) throws Exception;

    boolean isUserExist(String login) throws Exception;

    List<Credential> getUsersData () throws Exception;
}
