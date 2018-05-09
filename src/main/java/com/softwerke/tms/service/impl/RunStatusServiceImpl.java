package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.RunStatusDAO;
import com.softwerke.tms.repository.RunStatus;
import com.softwerke.tms.service.RunStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RunStatusServiceImpl implements RunStatusService{

    @Autowired
    RunStatusDAO runStatusDAO;

    @Override
    public String getStatusName(int id) {
        return runStatusDAO.getStatusName(id);
    }

    @Override
    public List<RunStatus> getStatuses() {
        return runStatusDAO.getStatuses();
    }
}
