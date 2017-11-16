package com.softwerke.tms.service;

import javax.persistence.NoResultException;

public class BadRequestException extends RuntimeException {

    public BadRequestException(NoResultException e) {
        super(e);
    }
}
