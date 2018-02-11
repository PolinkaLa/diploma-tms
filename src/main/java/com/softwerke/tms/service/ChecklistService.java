package com.softwerke.tms.service;

import com.softwerke.tms.model.Checklist;

import java.util.List;

public interface ChecklistService {
    List<Checklist> getAll();

    void save(Checklist checklist);

    Checklist getOne(int id);
}
