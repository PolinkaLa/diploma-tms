package com.softwerke.tms.service;

import com.softwerke.tms.repository.Test;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CSVService {

    List<Test> importChecklist(MultipartFile file, int checklistId, int userId) throws Exception;

}
