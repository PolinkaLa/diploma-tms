package com.softwerke.tms.service.impl;

import com.softwerke.tms.model.Test;
import com.softwerke.tms.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

@Service
public class TestServiceImpl implements TestService{

    public static final String GET_ALL_QUERY = "select * from Tickets";

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public Set<Test> getAll() {
        return new HashSet<>(jdbcTemplate.query(GET_ALL_QUERY, new RowMapper<Test>() {
            @Override
            public Test mapRow(ResultSet rs, int rowNum) throws SQLException {
                Test test = new Test();
                test.setId(rs.getInt(1));
                //other fields mapping
                return test;
            }
        }));
    }

    @Override
    public void save(Test test) {

    }

    @Override
    public Test getOne(int id) {
        return null;
    }
}
