package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;

import java.io.IOException;
import java.util.List;

public interface CSVService {

    List<Test> importChecklist() throws IOException;

}
