package com.softwerke.tms.web.api;

import com.softwerke.tms.dao.model.User;
import com.softwerke.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by LappoPolina on 02.12.2017.
 */
@RestController
public class UserRestController {

    @Autowired
    private UserService userService;

    @GetMapping("/api/users")
    public List<User> findUsers() {
        return userService.getAll();
    }
}
