package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.ReportDAO;
import com.softwerke.tms.model.ReportData;
import com.softwerke.tms.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    ReportDAO reportDAO;

    @Override
    public List<ReportData> getTestsGroupByUsers() {
        return reportDAO.getTestsGroupByUsers();
    }
}
