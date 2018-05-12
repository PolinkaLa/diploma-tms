package com.softwerke.tms.dao;

import com.softwerke.tms.repository.User;

import java.util.List;

public interface UserDAO {

    void insertUser(String name);

    User getUser(String login) throws Exception ;

    User getUserByID(int id);

    List<User> getUsers() throws Exception;

    void updateUser (User User) throws Exception;

    boolean isUserExist (String login) throws Exception ;

    int getUserRole (String login);
}
