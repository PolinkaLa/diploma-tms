package com.softwerke.tms.controller;

import com.softwerke.tms.model.Type;
import com.softwerke.tms.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("/types")
    public List<Type> getAllTypes () {
        List<Type> type = typeService.getTypes();
        return type;
    }
    @PostMapping(value = "/addType")
    public void addType(@RequestBody Type type){
        String name = type.getName();
        typeService.insertType(name);
    }
}
