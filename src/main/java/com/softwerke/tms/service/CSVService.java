package com.softwerke.tms.service;

import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

import java.io.IOException;

public interface CSVService {

    void importChecklist(int checklistID);
    void exportChecklist(int checklistID) throws IOException, CsvDataTypeMismatchException,
    CsvRequiredFieldEmptyException;

}
