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
    public void insertTest(int checklist, int user, int type, int level, String title, String description) {
        getJdbcTemplate().update ("INSERT INTO test ( fk_checklist_id, fk_user_id, fk_type_id, fk_level_id," +
                        "title, description) VALUE ( ?, ?, ?, ?, ?, ?)",
                checklist, user, type, level, title, description);
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

    public void updateTest(Test test){
        //TODO
    }

    @Override
    public void delTest(int id) {
        //TODO
    }

    private class TestMapper implements RowMapper<Test> {

        @Override
        public Test mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Test test = new Test();
            test.setId(rs.getInt("id"));
            test.setFkChecklistId(rs.getInt("fk_checklist_id"));
            test.setFkUserId(rs.getInt("fk_user_id"));
            test.setFkTypeId(rs.getInt("fk_type_id"));
            test.setFkLevelId(rs.getInt("fk_level_id"));
            test.setTitle(rs.getString("title"));
            test.setDescription(rs.getString("description"));
            test.setCreatedDate(rs.getTimestamp("created_date"));
            test.setUpdatedDate(rs.getTimestamp("updated_date"));
            test.setFileName(rs.getString("file_name"));
            return test;
        }
    }
}
