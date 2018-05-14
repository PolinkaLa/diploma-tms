package com.softwerke.tms.controller;

import com.softwerke.tms.repository.Test;
import com.softwerke.tms.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
public class FileUploadController {

    @Autowired
    CSVService csvService;

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public int[] submit(@RequestParam("file") MultipartFile file, int checklistId, int userId) throws Exception {
        return csvService.importChecklist(file, checklistId, userId);
    }
}
