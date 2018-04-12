package com.softwerke.tms.service;

import com.softwerke.tms.model.Test;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CSVService {

    List<Test> importChecklist(MultipartFile file) throws Exception;

}
