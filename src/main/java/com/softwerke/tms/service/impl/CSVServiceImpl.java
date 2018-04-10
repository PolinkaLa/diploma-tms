package com.softwerke.tms.service.impl;

import com.opencsv.CSVReader;
import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.model.Test;
import com.softwerke.tms.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


@Service
public class CSVServiceImpl implements CSVService {

    @Autowired
    private TestDAO testDAO;

    @Override
    public List<Test> importChecklist() throws Exception {
        String csvFile = "C:/Users/lpv.SOFTWERKE/Downloads/false.csv";

        Scanner scanner = new Scanner(new File(csvFile), "UTF-8");
        List<Test> importedTests = new ArrayList<>();

        CSVReader reader = null;
        try {
            reader = new CSVReader(new InputStreamReader(new FileInputStream(csvFile), "UTF-8"));
            String[] lineHeader;
            String[] line;
            lineHeader = reader.readNext();
            while ((line = reader.readNext()) != null) {
                Test test = new Test();
                test.setId(Integer.parseInt(line[0]));
                test.setTitle(line[1]);
                test.setDescription(line[2]);
                test.setFkLevelId(Integer.parseInt(line[3]));
                test.setFkTypeId(Integer.parseInt(line[4]));
                importedTests.add(test);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            for (Test testItem : importedTests) {
                if (testDAO.isTestExist(testItem.getId())) {
                    testDAO.updateTest(testItem);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return importedTests;

    }

}
