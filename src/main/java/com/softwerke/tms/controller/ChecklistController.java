package com.softwerke.tms.controller;

import com.softwerke.tms.model.Checklist;
import com.softwerke.tms.service.ChecklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ChecklistController {

    @Autowired
    ChecklistService checklistService;

    @RequestMapping("/checklists")
    public List<Checklist> getAllChecklists () {
        List<Checklist> checklists = checklistService.getChecklists();
        return checklists;
    }
}
