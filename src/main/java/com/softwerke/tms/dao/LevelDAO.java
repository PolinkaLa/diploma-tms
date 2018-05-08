package com.softwerke.tms.dao;

import com.softwerke.tms.repository.Level;

import java.util.List;

public interface LevelDAO {
    void insertLevel(String name);

    String getLevelName(int id);

    List<Level> getLevels();

    void updateLevel (Level level)throws Exception;

    void delLevel(Level level) throws Exception;
}
