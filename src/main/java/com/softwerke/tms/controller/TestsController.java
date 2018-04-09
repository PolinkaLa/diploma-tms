package com.softwerke.tms.controller;

import com.softwerke.tms.model.Test;
import com.softwerke.tms.service.CSVService;
import com.softwerke.tms.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping("/import")
    public List<Test> importTest() throws IOException {
        List<Test> tests = csvService.importChecklist();
        return tests;
    }

    @PostMapping(value = "/addTest")
    public void addTests(@RequestBody Test test){
        int checklist = test.getFkChecklistId();
        int user = test.getFkUserId();
        int type = test.getFkTypeId();
        int level = test.getFkLevelId();
        String title = test.getTitle();
        String description = test.getDescription();
        testService.insertTest(checklist, user, type, level, title, description);
    }

}
