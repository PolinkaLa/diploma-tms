package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;

import java.util.List;

public interface CSVService {

    List<Test> importChecklist() throws Exception;

}
