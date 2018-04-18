package com.softwerke.tms.service;

import com.softwerke.tms.model.ReportData;

import java.util.List;

public interface ReportService {
    List<ReportData> getTestsGroupByUsers();
}
