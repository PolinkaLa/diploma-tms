package com.softwerke.tms.dao;

import com.softwerke.tms.repository.Type;

import java.util.List;

public interface TypeDAO {
    void insertType(String name);

    String getTypeName(int id);

    int getTypeId(String name);

    List<Type> getTypes();

    void updateType (Type type) throws Exception;

    void delType(int id);
}
