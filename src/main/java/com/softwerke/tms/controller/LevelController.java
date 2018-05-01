package com.softwerke.tms.controller;

import com.softwerke.tms.repository.Level;
import com.softwerke.tms.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class LevelController {

    @Autowired
    private LevelService levelService;

    @RequestMapping("/levels")
    public List<Level> getAllLevels () {
        List<Level> level = levelService.getLevels();
        return level;
    }
    @PostMapping(value = "/addLevel")
    public void addLevel(@RequestBody Level level){
        String name = level.getName();
        levelService.insertLevel(name);
    }
}
