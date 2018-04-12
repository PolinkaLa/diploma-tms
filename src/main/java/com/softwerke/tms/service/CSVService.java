package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;

import java.io.InputStream;
import java.util.List;

public interface CSVService {

    List<Test> importChecklist(InputStream fileReader, String fileName) throws Exception;

}
