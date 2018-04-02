package com.softwerke.tms.controller;

import com.softwerke.tms.model.Checklist;
import com.softwerke.tms.model.Project;
import com.softwerke.tms.service.ChecklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ChecklistController {

    @Autowired
    ChecklistService checklistService;

    @RequestMapping("/checklists")
    public List<Checklist> getAllChecklists (@RequestParam int projectId) {
        List<Checklist> checklists = checklistService.getChecklists(projectId);
        return checklists;
    }
    @PostMapping(value = "/addChecklist")
    public void addChecklist(@RequestBody Checklist checklist){
        String name = checklist.getTitle();
        boolean status = checklist.isActiveStatus();
        int project = checklist.getFkProjectId();
        checklistService.insertChecklist(name, status, project);
    }
}
