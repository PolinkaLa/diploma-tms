package com.softwerke.tms.controller;

import com.softwerke.tms.repository.Credential;
import com.softwerke.tms.repository.Role;
import com.softwerke.tms.service.RoleService;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UsersController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;


    @RequestMapping("/users")
    public List<Credential> getAllUsers () throws Exception{
        List<Credential> usersData = userService.getUsersData();
        return usersData;
    }

    @RequestMapping("/roles")
    public List<Role> getAllRoles () throws Exception{
        List<Role> roles = roleService.getRoles();
        return roles;
    }

}
