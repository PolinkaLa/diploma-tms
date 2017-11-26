package com.softwerke.tms;

import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataBaseConfiguration {

    @Bean
    public DataSource dataSource() {
        final BasicDataSource bdSource = new BasicDataSource();
        bdSource.setDriverClassName("com.mysql.jdbc.Driver");
        bdSource.setUrl("jdbc:mysql://localhost:3306/tms_db");
        bdSource.setUsername("root");
        bdSource.setPassword("1234");
        return bdSource;
    }

}