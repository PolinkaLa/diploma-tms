package com.softwerke.tms.web;

import com.softwerke.tms.dao.manager.TestManager;
import com.softwerke.tms.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestsController {

    @Autowired
    private TestManager testManager;

    @RequestMapping("/tests")
    public Test greeting(@RequestParam(value="name", required=false, defaultValue="World") String name) {
        Test test;
        test = testManager.getTest(1);
        return test;
    }
}
