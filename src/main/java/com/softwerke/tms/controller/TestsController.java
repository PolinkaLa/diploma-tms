package com.softwerke.tms.controller;

import com.softwerke.tms.service.CSVService;
import com.softwerke.tms.service.TestService;
import com.softwerke.tms.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
public class TestsController {

    @Autowired
    private TestService testService;
    @Autowired
    private CSVService csvService;

    @RequestMapping("/getTest")
    public Test getTest(@RequestParam int id) {
        Test test;
        test = testService.getTest(id);
        return test;
    }

    @RequestMapping("/getTests")
    public List<Test> getAllTests(@RequestParam int checklistId) {
        List<Test> tests;
        tests = testService.getTests(checklistId);
        return tests;
    }

    @RequestMapping("/addTest")
    public void insertTest(@RequestParam int checklist,
                           @RequestParam int user,
                           @RequestParam int type,
                           @RequestParam int level,
                           @RequestParam String title,
                           @RequestParam String description){
        testService.insertTest(checklist, user, type, level, title, description);
    }

    @RequestMapping("/import")
    public List<Test> importTest() throws IOException {
        return csvService.importChecklist(1);
    }
}
