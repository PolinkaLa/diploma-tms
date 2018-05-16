package com.softwerke.tms.controller;

import com.softwerke.tms.repository.ReportData;
import com.softwerke.tms.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ReportsController {
    @Autowired
    private ReportService reportService;

    @RequestMapping("/testGroupByUsers")
    public List<ReportData> getTestGroupByUsers () {
        return reportService.getTestsGroupByUsers();
    }

    @RequestMapping("/numberOfAllProject")
    int allProject(){
        return reportService.allProject();
    }

    @RequestMapping("/numberOfactiveProject")
    int activeProject(){
        return reportService.activeProject();
    }

    @RequestMapping("/numberOfAllChecklist")
    int allChecklist (int projectId){
        return reportService.allChecklist(projectId);
    }

    @RequestMapping("/numberOfActiveChecklist")
    int activeProject (int projectId){
        return reportService.activeChecklist(projectId);
    }

    @RequestMapping("/numberOfTests")
    int allTest(int checklistId){
        return reportService.allTest(checklistId);
    }

    @RequestMapping("/imported")
    int[] importedtests(){
        return reportService.imported();
    }

}
