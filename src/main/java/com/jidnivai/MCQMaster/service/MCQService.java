package com.jidnivai.MCQMaster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.repository.MCQRepository;

@Service
public class MCQService {

    @Autowired
    MCQRepository mcqRepository;

    public Long getTotalMCQ(){
        return mcqRepository.count();
    }
    public void saveMCQ(MCQ mcq) {
        mcqRepository.save(mcq);
    }
    public List<MCQ> getDemoMCQ() {
        return mcqRepository.findDemoMCQ();
    }
}
