package com.softwerke.tms.controller;

import com.softwerke.tms.model.Credential;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UsersController {

    @Autowired
    UserService userService;


    @RequestMapping("/users")
    public List<Credential> getAllUsers () throws Exception{
        List<Credential> usersData = userService.getUsersData();
        return usersData;
    }
}
