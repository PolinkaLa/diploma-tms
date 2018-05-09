package com.softwerke.tms.dao;

import com.softwerke.tms.repository.Run;

import java.util.List;

public interface RunDAO {
    void insertRun(Run run);

    List<Run> getRuns(int checklistId);
}
