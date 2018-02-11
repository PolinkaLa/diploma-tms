package com.softwerke.tms.service;

import com.softwerke.tms.model.Credential;

/**
 * Created by LappoPolina on 12.11.2017.
 */
public interface LdapService {

    String[] getUserData(String login) throws Exception;
    Credential authorizeUser(String login, String password);
}

