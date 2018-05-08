package com.softwerke.tms.service;

import com.softwerke.tms.repository.Level;

import java.util.List;

public interface LevelService {
    void insertLevel(String name);

    String getLevelName(int id);

    List<Level> getLevels();

    void updateLevel (Level level) throws Exception;

    void delLevel(Level level) throws Exception;
}
