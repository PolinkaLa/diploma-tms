package com.softwerke.tms.service.impl;

import com.opencsv.CSVReader;
import com.softwerke.tms.dao.LevelDAO;
import com.softwerke.tms.dao.TestDAO;
import com.softwerke.tms.dao.TypeDAO;
import com.softwerke.tms.model.Test;
import com.softwerke.tms.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;

import java.util.ArrayList;
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
    public List<Test> importChecklist(int checklistID) throws IOException{
        // TODO
        CSVReader reader = new CSVReader(new FileReader("D:/test.csv"));

        List<Test> emps = new ArrayList<Test>();

        String[] record;

        while ((record = reader.readNext()) != null) {
            Test emp = new Test();
            emp.setId(Integer.valueOf(record[0]));
            emp.setTitle(record[1]);
            emp.setDescription(record[2]);
            emp.setFkTypeId(typeDAO.getTypeId(record[3]));
            emps.add(emp);
        }
        reader.close();
        return emps;
    }
}
