package com.softwerke.tms.dao;

import com.softwerke.tms.model.Checklist;

import java.util.List;

public interface ChecklistDAO {

    void insertChecklist(Checklist checklist);

    Checklist getChecklist(int checklistID);

    List<Checklist> getChecklists(int projectId);

    void updateChecklist(Checklist checklist);
}
