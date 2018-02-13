package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.ChecklistDAO;
import com.softwerke.tms.model.Checklist;
import com.softwerke.tms.service.ChecklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChecklistServiceImpl implements ChecklistService{

    @Autowired
    ChecklistDAO checklistDAO;

    @Override
    public void insertChecklist(Checklist checklist) {

    }

    @Override
    public Checklist getChecklist(int checklistID) {
        return null;
    }

    @Override
    public List<Checklist> getChecklists() {
        return checklistDAO.getChecklists();
    }

    @Override
    public void updateChecklist(Checklist checklist) {

    }
}
