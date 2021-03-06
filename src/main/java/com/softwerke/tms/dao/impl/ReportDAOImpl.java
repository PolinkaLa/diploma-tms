package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.ReportDAO;
import com.softwerke.tms.repository.ReportData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class ReportDAOImpl extends JdbcDaoSupport implements ReportDAO {
    @Autowired
    ReportDAOImpl (DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public List<ReportData> getTestsGroupByUsers() {
        List<ReportData> reportData = getJdbcTemplate().
                query("SELECT fk_user_id, COUNT(fk_user_id) FROM test GROUP BY fk_user_id",
                        new ReportDataMapper()
                );
        return reportData;
    }

    @Override
    public int allProject() {
        int count = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM project",
                        new Object[]{}, Integer.class);
        return count;
    }

    @Override
    public int activeProject() {
        int count = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM project WHERE active_status= TRUE",
                        new Object[]{}, Integer.class);
        return count;
    }

    @Override
    public int allChecklist(int projectId) {
        int count = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM checklist WHERE fk_project_id = ?",
                        new Object[]{ projectId}, Integer.class);
        return count;
    }

    @Override
    public int activeChecklist(int projectId) {
        int count = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM checklist WHERE fk_project_id = ? AND active_status= TRUE",
                        new Object[]{projectId}, Integer.class);
        return count;
    }

    @Override
    public int allTest(int checklistId) {
        int count = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM test WHERE fk_checklist_id = ?",
                        new Object[]{checklistId}, Integer.class);
        return count;
    }

    @Override
    public int[] imported() {
        int[] count = new int [2];
        count[0] = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM test WHERE file_name is not NULL",
                        new Object[]{}, Integer.class);
        count[1] = getJdbcTemplate().
                queryForObject("SELECT COUNT(id) FROM test WHERE file_name is NULL",
                        new Object[]{}, Integer.class);
        return count;
    }


    private class ReportDataMapper implements RowMapper<ReportData> {

        @Override
        public ReportData mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            ReportData reportData = new ReportData();
            reportData.setValue(rs.getInt("COUNT(fk_user_id)"));
            reportData.setName(rs.getString("fk_user_id"));
            return reportData;
        }
    }
}
