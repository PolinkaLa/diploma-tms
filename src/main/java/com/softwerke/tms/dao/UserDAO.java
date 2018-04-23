package com.softwerke.tms.dao;

import com.softwerke.tms.model.Credential;
import com.softwerke.tms.model.User;

import java.util.List;

public interface UserDAO {

    void insertUser(String name);

    User getUser(String login) throws Exception ;

    User getUserByID(int id);

    List<User> getUsers() throws Exception;

    void updateUser (User User);

    boolean isUserExist (String login) throws Exception ;
}
