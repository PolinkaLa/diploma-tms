package com.softwerke.tms.controller;

import com.softwerke.tms.model.Test;
import com.softwerke.tms.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

@RestController
public class FileUploadController {

    @Autowired
    CSVService csvService;

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public List<Test> submit(@RequestParam("file") MultipartFile file, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("file", file);
        String fileName = file.getOriginalFilename();
        InputStream reader = file.getInputStream();
        List<Test> csv = csvService.importChecklist(reader, fileName);

        return csv;
    }

}
