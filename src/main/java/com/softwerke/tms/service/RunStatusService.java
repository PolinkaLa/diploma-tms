package com.softwerke.tms.service;

import com.softwerke.tms.repository.RunStatus;

import java.util.List;

public interface RunStatusService {
    String getStatusName (int id);

    List<RunStatus> getStatuses ();
}
