package com.softwerke.tms.service;

import com.softwerke.tms.model.Checklist;

import java.util.List;

public interface ChecklistService {

    void insertChecklist(String name, boolean status, int project);

    Checklist getChecklist(int checklistID);

    List<Checklist> getChecklists(int projectId);

    void updateChecklist(Checklist checklist);
}
