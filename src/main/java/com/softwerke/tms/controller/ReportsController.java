package com.softwerke.tms.controller;

import com.softwerke.tms.model.ReportData;
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

}
