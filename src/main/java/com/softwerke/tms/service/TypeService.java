package com.softwerke.tms.service;

import com.softwerke.tms.model.Type;

import java.util.List;

public interface TypeService {
    void insertType(String name);

    String getTypeName(int id);

    List<Type> getTypes();

    void updateType (Type type);

    void delType(int id);
}
