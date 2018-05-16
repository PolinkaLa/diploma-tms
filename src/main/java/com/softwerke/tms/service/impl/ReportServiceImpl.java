package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.ReportDAO;
import com.softwerke.tms.repository.ReportData;
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

    @Override
    public int allProject() {
        return reportDAO.allProject();
    }

    @Override
    public int activeProject() {
        return reportDAO.activeProject();
    }

    @Override
    public int allChecklist(int projectId) {
        return reportDAO.allChecklist(projectId);
    }

    @Override
    public int activeChecklist(int projectId) {
        return reportDAO.activeChecklist(projectId);
    }

    @Override
    public int allTest(int checklistId) {
        return reportDAO.allTest(checklistId);
    }

    @Override
    public int[] imported() {
        return reportDAO.imported();
    }
}
