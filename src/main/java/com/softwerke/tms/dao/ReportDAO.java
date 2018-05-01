package com.softwerke.tms.dao;

import com.softwerke.tms.repository.ReportData;

import java.util.List;

public interface ReportDAO {

    List<ReportData> getTestsGroupByUsers ();

}
