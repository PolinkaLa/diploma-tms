package com.softwerke.tms.dao.jdbc;

import com.softwerke.tms.dao.model.User;

import java.util.List;


public interface UserDAO {
    //Create
    void save(User user);

    //Read
    User getByPrinsipalName(String prinsipalName);

    //Update
    void update(User user);

    //Delete
    void deleteById(int id);

    //Get All
    List<User> getAll();
}
