package com.softwerke.tms.service;

import com.softwerke.tms.repository.Credential;

public interface LdapService {

    String[] getUserData(String login) throws Exception;
    Credential authorizeUser(String login, String password);
}

