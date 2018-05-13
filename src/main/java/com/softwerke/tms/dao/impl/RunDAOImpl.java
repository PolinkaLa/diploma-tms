package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.RunDAO;
import com.softwerke.tms.repository.Run;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class RunDAOImpl extends JdbcDaoSupport implements RunDAO {

    @Autowired
    public RunDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertRun(Run run) {
        getJdbcTemplate().update ("INSERT INTO run (name, fk_checklist_id) VALUE (?, ?)",
                run.getName(),
                run.getFkChecklistId());
    }

    @Override
    public List<Run> getRuns(int checklistId) {
        List<Run> runs = getJdbcTemplate().
                query("SELECT * FROM run WHERE fk_checklist_id = ? ",
                        new Object[] {checklistId},
                        new RunMapper()
                );
        return runs;
    }

    private class RunMapper implements RowMapper<Run> {

        @Override
        public Run mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Run run = new Run();
            run.setId(rs.getInt("id"));
            run.setName(rs.getString("name"));
            run.setCreatedDate(rs.getTimestamp("created_date"));
            run.setFkChecklistId(rs.getInt("fk_checklist_id"));
            return run;
        }
    }
}
