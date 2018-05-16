package com.softwerke.tms.dao;

import com.softwerke.tms.repository.ReportData;

import java.util.List;

public interface ReportDAO {

    List<ReportData> getTestsGroupByUsers ();

    int allProject();
    int activeProject();

    int allChecklist (int projectId);
    int activeChecklist (int projectId);

    int allTest(int checklistId);

    int[] imported ();

}
