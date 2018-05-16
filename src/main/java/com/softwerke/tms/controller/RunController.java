package com.softwerke.tms.controller;

import com.softwerke.tms.repository.Run;
import com.softwerke.tms.repository.RunStatus;
import com.softwerke.tms.service.RunService;
import com.softwerke.tms.service.RunStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RunController {

    @Autowired
    RunStatusService runStatusService;

    @Autowired
    RunService runService;

    @RequestMapping("/status")
    public List<RunStatus> getAllStatus () {
        return runStatusService.getStatuses();
    }

    @RequestMapping("/getRuns")
    public List<Run> getRuns (int checklistId) {
        return runService.getRuns(checklistId);
    }

    @PostMapping("/addRun")
    public void addRun (@RequestBody Run run) {
        runService.insertRun(run);
    }

    @PostMapping("/updateStatus")
    public void updateStatus (@RequestBody int test, int run, int status) {
        runService.updateStatus(test, run, status);
    }
}
