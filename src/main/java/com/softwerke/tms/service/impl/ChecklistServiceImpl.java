package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.ChecklistDAO;
import com.softwerke.tms.repository.Checklist;
import com.softwerke.tms.service.ChecklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ChecklistServiceImpl implements ChecklistService{

    @Autowired
    ChecklistDAO checklistDAO;

    @Override
    public void insertChecklist(Checklist checklist) {
        checklistDAO.insertChecklist(checklist);
    }

    @Override
    public Checklist getChecklist(int checklistID) {
        // TODO
        return null;
    }

    @Override
    public List<Checklist> getChecklists(int projectId) {
        List<Checklist> сhecklists = checklistDAO.getChecklists(projectId);
        for (Checklist сhecklist : сhecklists) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            String date = dateFormat.format(сhecklist.getCreatedDate());
            сhecklist.setcDate(date);
        }
        return сhecklists;
    }

    @Override
    public void updateChecklist(Checklist checklist) throws Exception {
        checklistDAO.updateChecklist(checklist);
    }
}
