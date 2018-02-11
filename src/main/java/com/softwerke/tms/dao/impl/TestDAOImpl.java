package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class TestDAOImpl extends JdbcDaoSupport implements TestDAO {

    @Autowired
    public TestDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertTest(Test test) {

    }

    @Override
    public Test getTest(int testID) {
        Test test = getJdbcTemplate().
                queryForObject("SELECT * FROM test WHERE id = ?",
                        new Object[] {testID},
                        new TestMapper()
                );
        return test;
    }

    @Override
    public List<Test> getTests() {
        List<Test> tests = getJdbcTemplate().
                query("SELECT * FROM test",
                        new TestMapper()
                );
        return tests;
    }

    private class TestMapper implements RowMapper<Test> {

        @Override
        public Test mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Test test = new Test();
            test.setId(rs.getInt("id"));
            test.setTitle(rs.getString("title"));
            test.setDescription(rs.getString("description"));
            return test;
        }
    }
}
