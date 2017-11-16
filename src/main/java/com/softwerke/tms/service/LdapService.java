package com.softwerke.tms.service;

import com.softwerke.tms.entity.User;

/**
 * Created by LappoPolina on 12.11.2017.
 */
public interface LdapService {

    String[] getUserData(String login) throws Exception;
    User authorizeUser(String login, String password);
}

