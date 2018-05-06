package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.RoleDAO;
import com.softwerke.tms.dao.UserDAO;
import com.softwerke.tms.repository.Credential;
import com.softwerke.tms.repository.User;
import com.softwerke.tms.service.LdapService;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDAO userDAO;

    @Autowired
    RoleDAO roleDAO;

    @Autowired
    LdapService ldapService;

    @Override
    public void insertUser(String name) {
        userDAO.insertUser(name);
    }

    @Override
    public User getUser(String login)  throws Exception{
        return userDAO.getUser(login);
    }

    @Override
    public User getUserByID(int id) {
        return userDAO.getUserByID(id);
    }

    @Override
    public List<User> getUsers() {
        try {
            return userDAO.getUsers();
        }
        catch (Exception e) {
            return null;
        }
    }

    @Override
    public void updateUser(User User) {
        // TODO
    }

    public boolean isUserExist(String login)  throws Exception{
        return userDAO.isUserExist(login);
    }

    @Override
    public List<Credential> getUsersData() throws Exception{
        try {
            List<Credential> usersData = new ArrayList<>();
            List<User> users;
            users = getUsers();
            for (User user: users){
                Credential userData = new Credential();
                String[] ldapData = ldapService.getUserData(user.getPrincipalName());
                userData.setId(user.getId());
                userData.setRole(user.getFkRoleId());
                userData.setLogin(user.getPrincipalName());
                String[] temp;
                temp = ldapData[0].split("= ");
                userData.setName(temp[1]);
                temp = ldapData[1].split("= ");
                userData.setEmail(temp[1]);
                String roleName = roleDAO.getRoleName(user.getFkRoleId());
                userData.setRoleName(roleName);
                usersData.add(userData);
            }
            return  usersData;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
