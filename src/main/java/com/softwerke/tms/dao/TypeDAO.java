package com.softwerke.tms.dao;

import com.softwerke.tms.model.Type;

import java.util.List;

public interface TypeDAO {
    void insertType(String name);

    String getTypeName(int id);

    List<Type> getTypes();

    void updateType (Type type);

    void delType(int id);
}
