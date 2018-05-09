package com.softwerke.tms.dao;

import com.softwerke.tms.repository.RunStatus;

import java.util.List;

public interface RunStatusDAO {

    String getStatusName (int id);

    List<RunStatus> getStatuses ();
}
