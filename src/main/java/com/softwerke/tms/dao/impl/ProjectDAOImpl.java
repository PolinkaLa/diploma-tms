package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.ProjectDAO;
import com.softwerke.tms.repository.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class ProjectDAOImpl extends JdbcDaoSupport implements ProjectDAO {

    @Autowired
    ProjectDAOImpl (DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertProject(String name, boolean status) {
        getJdbcTemplate().update ("INSERT INTO project (title, active_status) VALUE ( ?, ?)", name, status);

    }

    @Override
    public Project getProject(int projectID) {
        // TODO
        return null;
    }

    @Override
    public List<Project> getProjects() {
        List<Project> projects = getJdbcTemplate().
                query("SELECT * FROM project",
                        new ProjectMapper()
                );

        return projects;
    }

    @Override
    public List<Project> getActiveProjects() {
        List<Project> projects = getJdbcTemplate().
                query("SELECT * FROM project WHERE active_status = TRUE",
                        new ProjectMapper()
                );
        return projects;
    }

    @Override
    public void updateProject(Project project) throws Exception {
        try {
            getJdbcTemplate().update("UPDATE project SET title = ? , active_status = ? WHERE id = ?",
                    project.getTitle(),
                    project.isActiveStatus(),
                    project.getId());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private class ProjectMapper implements RowMapper<Project> {

        @Override
        public Project mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Project project = new Project();
            project.setId(rs.getInt("id"));
            project.setTitle(rs.getString("title"));
            project.setCreatedDate(rs.getTimestamp("created_date"));
            project.setActiveStatus(rs.getBoolean("active_status"));
            return project;
        }
    }
}
