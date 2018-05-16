package com.softwerke.tms.service;

import com.softwerke.tms.repository.ReportData;

import java.util.List;

public interface ReportService {
    List<ReportData> getTestsGroupByUsers();
    int allProject();
    int activeProject();

    int allChecklist (int projectId);
    int activeChecklist (int projectId);

    int allTest(int checklistId);
    int[] imported ();
}
