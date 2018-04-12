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
import java.sql.Timestamp;
import java.util.List;

@Service
public class TestDAOImpl extends JdbcDaoSupport implements TestDAO {

    @Autowired
    public TestDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertTest(int checklist, int user, int type, int level, String title, String description, String file) {
        getJdbcTemplate().update ("INSERT INTO test ( fk_checklist_id, fk_user_id, fk_type_id, fk_level_id," +
                        "title, description, file_name) VALUE ( ?, ?, ?, ?, ?, ?, ?)",
                checklist, user, type, level, title, description, file);
    }

    @Override
    public Test getTest(int testID) throws Exception{
        try{
        Test test = getJdbcTemplate().
                queryForObject("SELECT * FROM test WHERE id = ?",
                        new Object[] {testID},
                        new TestMapper()
                );
        return test;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Test> getTests(int checklistId) {
        List<Test> tests = getJdbcTemplate().
                query("SELECT * FROM test WHERE fk_checklist_id = ?",
                        new Object[] {checklistId},
                        new TestMapper()
                );
        return tests;
    }

    @Override
    public void updateTest(Test test){
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        getJdbcTemplate().update ("UPDATE test SET title=?, " +
                        "description=?," +
                        "fk_user_id=?," +
                        "fk_type_id=?," +
                        "fk_level_id=?," +
                        "updated_date=?," +
                        "file_name=?" +
                        " WHERE id= ?",
                test.getTitle(),
                test.getDescription(),
                test.getFkUserId(),
                test.getFkTypeId(),
                test.getFkLevelId(),
                timestamp,
                test.getFileName(),
                test.getId());
    }

    @Override
    public void delTest(int id) {
        //TODO
    }

    @Override
    public boolean isTestExist(int id) throws Exception {
        try {
            if (getTest(id) == null) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public int getChecklistOfTest(int id) throws Exception{
        return getTest(id).getFkChecklistId();
    }

    @Override
    public void insertTestFromFile(Test test) throws Exception{
        getJdbcTemplate().update ("INSERT INTO test ( fk_checklist_id, fk_user_id, fk_type_id, fk_level_id," +
                        "title, description, file_name) VALUE ( ?, ?, ?, ?, ?, ?, ?)",
                test.getFkChecklistId(),
                test.getFkUserId(),
                test.getFkTypeId(),
                test.getFkLevelId(),
                test.getTitle(),
                test.getDescription(),
                test.getFileName());
    }

    @Override
    public void copyTest(Test test) throws Exception {
        insertTest(test.getFkChecklistId(),
                test.getFkUserId(),
                test.getFkTypeId(),
                test.getFkLevelId(),
                test.getTitle(),
                test.getDescription(),
                test.getFileName());
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
