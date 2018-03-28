package com.softwerke.tms.service;

import java.util.List;

public interface ChecklistService {

    void insertChecklist(com.softwerke.tms.model.Checklist checklist);

    com.softwerke.tms.model.Checklist getChecklist(int checklistID);

    List<com.softwerke.tms.model.Checklist> getChecklists(int projectId);

    void updateChecklist(com.softwerke.tms.model.Checklist checklist);
}
