package com.softwerke.tms.service.impl;

import com.opencsv.CSVReader;
import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.repository.Test;
import com.softwerke.tms.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;


@Service
public class CSVServiceImpl implements CSVService {

    @Autowired
    private TestDAO testDAO;

    @Override
    public List<Test> importChecklist(MultipartFile file, int checklistId, int userId) throws Exception {

        String fileName = file.getOriginalFilename();
        InputStream fileReader = file.getInputStream();
        List<Test> importedTests = new ArrayList<>();
        CSVReader reader = null;
        try {
            reader = new CSVReader(new InputStreamReader(fileReader, "UTF-8"));
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
                test.setFileName(fileName);
                test.setFkChecklistId(checklistId);
                test.setFkUserId(userId);
                importedTests.add(test);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            for (Test testItem : importedTests) {
                if (testItem.getId() >= 0 && testDAO.isTestExist(testItem.getId())) {
                    if (testDAO.getChecklistOfTest(testItem.getId()) == checklistId) {
                        testDAO.updateTest(testItem);
                    }
                    else {
                        testDAO.copyTest(testItem);
                    }
                }
                else {
                    testDAO.insertTestFromFile(testItem);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return importedTests;

    }

}
