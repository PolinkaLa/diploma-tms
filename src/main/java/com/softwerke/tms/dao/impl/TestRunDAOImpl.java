package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.TestRunDAO;
import com.softwerke.tms.repository.TestRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

@Service
public class TestRunDAOImpl extends JdbcDaoSupport implements TestRunDAO{

    @Autowired
    public TestRunDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public TestRun getTestRun(int test, int run) {
        TestRun testRun = getJdbcTemplate().
                queryForObject("SELECT * FROM test_run WHERE fk_test_id = ? and fk_run_id=?",
                        new Object[] {test, run},
                        new TestRunMapper()
                );
        return testRun;
    }
    private class TestRunMapper extends JdbcDaoSupport implements RowMapper<TestRun> {

        @Override
        public TestRun mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            TestRun testRun = new TestRun();
            testRun.setId(rs.getInt("id"));
            testRun.setTest(rs.getInt("fk_test_id"));
            testRun.setRun(rs.getInt("fk_run_id"));
            testRun.setTest(rs.getInt("fk_run_id"));
            return testRun;
        }
    }
}
