package com.softwerke.tms.service;

import com.softwerke.tms.repository.Checklist;

import java.util.List;

public interface ChecklistService {

    void insertChecklist(Checklist checklist);

    Checklist getChecklist(int checklistID);

    List<Checklist> getChecklists(int projectId);

    List<Checklist> getActiveChecklists(int projectId);

    void updateChecklist(Checklist checklist) throws Exception;
}
