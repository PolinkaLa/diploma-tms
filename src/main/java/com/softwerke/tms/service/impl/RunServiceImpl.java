package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.RunDAO;
import com.softwerke.tms.repository.Run;
import com.softwerke.tms.service.RunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RunServiceImpl implements RunService {
    @Autowired
    RunDAO runDAO;

    @Override
    public void insertRun(Run run) {
        runDAO.insertRun(run);
    }

    @Override
    public List<Run> getRuns(int checklistId) {
        return runDAO.getRuns(checklistId);
    }
}
