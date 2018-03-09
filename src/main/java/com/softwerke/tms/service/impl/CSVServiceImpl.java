package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.LevelDAO;
import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.dao.TypeDAO;
import com.softwerke.tms.model.Test;
import com.softwerke.tms.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;

import java.util.Iterator;
import java.util.List;


@Service
public class CSVServiceImpl implements CSVService {

    @Autowired
    private TestDAO testDAO;
    @Autowired
    private LevelDAO levelDAO;
    @Autowired
    private TypeDAO typeDAO;

    @Override
    public void importChecklist(int checklistID) {
        // TODO
    }

    @Override
    public void exportChecklist(int checklistID) throws IOException {

        List<Test> test = testDAO.getTests();
        String COMMA_DELIMITER = "; ";
        String LINE_SEPARATOR = "\n";

        String HEADER = "ID; Title; Description; Type; Level";

        FileWriter fileWriter = null;

        try {
            fileWriter = new FileWriter("D:/test.csv");
            fileWriter.append(HEADER);
            fileWriter.append(LINE_SEPARATOR);
            Iterator it = test.iterator();
            while (it.hasNext()) {
                Test e = (Test) it.next();
                fileWriter.append(String.valueOf(e.getId()));
                fileWriter.append(COMMA_DELIMITER);
                fileWriter.append(e.getTitle());
                fileWriter.append(COMMA_DELIMITER);
                fileWriter.append(e.getDescription());
                fileWriter.append(COMMA_DELIMITER);
                fileWriter.append(typeDAO.getTypeName(e.getFkTypeId()));
                fileWriter.append(COMMA_DELIMITER);
                fileWriter.append(levelDAO.getLevelName(e.getFkLevelId()));
                fileWriter.append(LINE_SEPARATOR);
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        } finally {
            try {
                fileWriter.close();
            } catch (IOException ie) {
                ie.printStackTrace();
            }
        }
    }
}
