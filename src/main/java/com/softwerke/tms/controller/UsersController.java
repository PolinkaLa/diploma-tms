package com.softwerke.tms.controller;

import com.softwerke.tms.model.User;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UsersController {

    @Autowired
    UserService userService;

    @RequestMapping("/users")
    public List<User> getAllUsers (@RequestParam(value="name", required=false, defaultValue="World") String name) {
        List<User> users = userService.getUsers();
        return users;
        }

//    public ModelAndView handleIssuesView() {
//        ModelAndView modelAndView = new ModelAndView("page/users");
//        modelAndView.addObject("view", "page/users");
//        modelAndView.addObject("title", "Users Page");
//
//        return modelAndView;
//    }
}
