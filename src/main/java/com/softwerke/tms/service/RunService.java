package com.softwerke.tms.service;

import com.softwerke.tms.repository.Run;

import java.util.List;

public interface RunService {

    void insertRun(Run run);

    List<Run> getRuns(int checklistId);

    void updateStatus(int test, int run, int status);
}
