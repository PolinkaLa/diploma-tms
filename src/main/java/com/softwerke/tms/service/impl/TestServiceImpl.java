package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.model.Test;
import com.softwerke.tms.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class TestServiceImpl implements TestService{
    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Test> getAll() {
        return null;
    }

    @Override
    public void save(Test test) {

    }

    @Override
    public Test getOne(int id) {
        String sql = "SELECT * FROM test where id=:id";

        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetchFirst(Test.class);
        }
    }
}
