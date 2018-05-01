package com.softwerke.tms.service.impl;


import com.softwerke.tms.dao.TypeDAO;
import com.softwerke.tms.repository.Type;
import com.softwerke.tms.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService{
    @Autowired
    private TypeDAO typeDAO;

    @Override
    public void insertType(String name) {
        typeDAO.insertType(name);
    }

    @Override
    public String getTypeName(int id) {
        return typeDAO.getTypeName(id);
    }

    @Override
    public List<Type> getTypes() {
        return typeDAO.getTypes();
    }

    @Override
    public void updateType(Type type) {
        typeDAO.updateType(type);
    }

    @Override
    public void delType(int id) {
        typeDAO.delType(id);
    }
}
