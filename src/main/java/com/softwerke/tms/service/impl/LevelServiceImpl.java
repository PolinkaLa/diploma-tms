package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.LevelDAO;
import com.softwerke.tms.repository.Level;
import com.softwerke.tms.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LevelServiceImpl implements LevelService{
    @Autowired
    private LevelDAO levelDAO;

    @Override
    public void insertLevel(String name) {
        levelDAO.insertLevel(name);
    }

    @Override
    public String getLevelName(int id) {
        return levelDAO.getLevelName(id);
    }

    @Override
    public List<Level> getLevels() {
        return levelDAO.getLevels();
    }

    @Override
    public void updateLevel(Level level) {
        levelDAO.updateLevel(level);
    }

    @Override
    public void delLevel(int id) {
        levelDAO.delLevel(id);
    }
}
