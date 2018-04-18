package com.softwerke.tms.dao;

import com.softwerke.tms.model.ReportData;

import java.util.List;

public interface ReportDAO {

    List<ReportData> getTestsGroupByUsers ();

}
