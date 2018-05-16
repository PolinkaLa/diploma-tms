package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.ChecklistDAO;
import com.softwerke.tms.repository.Checklist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class ChecklistDAOImpl extends JdbcDaoSupport implements ChecklistDAO {

    @Autowired
    ChecklistDAOImpl (DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertChecklist(Checklist checklist) {
        getJdbcTemplate().update ("INSERT INTO checklist (title, active_status, fk_project_id) VALUE ( ?, ?, ?)",
                checklist.getTitle(),
                checklist.isActiveStatus(),
                checklist.getFkProjectId());
    }

    @Override
    public Checklist getChecklist(int checklistID) {
        // TODO
        return null;
    }

    @Override
    public List<Checklist> getChecklists(int projectId) {
        List<Checklist> checklists = getJdbcTemplate().
                query("SELECT * FROM checklist WHERE fk_project_id = ? ",
                        new Object[] {projectId},
                        new ChecklistMapper()
                );
        return checklists;
    }

    @Override
    public List<Checklist> getActiveChecklists(int projectId) {
        List<Checklist> checklists = getJdbcTemplate().
                query("SELECT * FROM checklist WHERE fk_project_id = ? AND active_status = TRUE",
                        new Object[] {projectId},
                        new ChecklistMapper()
                );
        return checklists;
    }

    @Override
    public void updateChecklist(Checklist checklist) throws Exception {
        try {
            getJdbcTemplate().update("UPDATE checklist SET title = ? , active_status = ? WHERE id = ?",
                    checklist.getTitle(),
                    checklist.isActiveStatus(),
                    checklist.getId());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private class ChecklistMapper implements RowMapper<Checklist> {

        @Override
        public Checklist mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Checklist checklist = new Checklist();
            checklist.setId(rs.getInt("id"));
            checklist.setTitle(rs.getString("title"));
            checklist.setFkProjectId(rs.getInt("fk_project_id"));
            checklist.setCreatedDate(rs.getTimestamp("created_date"));
            checklist.setActiveStatus(rs.getBoolean("active_status"));
            return checklist;
        }
    }
}
