package com.softwerke.tms.service;

import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;
import com.softwerke.tms.model.Test;

import java.io.IOException;
import java.util.List;

public interface CSVService {

    List<Test> importChecklist(int checklistID) throws IOException;

}
