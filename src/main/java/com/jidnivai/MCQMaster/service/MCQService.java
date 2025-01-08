package com.jidnivai.MCQMaster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.User;
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
    public List<String> getDomains() {
        return mcqRepository.findAllDistictDomains();
    }
    public List<String> getTopicsByDomain(List<String> domain) {
        return mcqRepository.findTopicsByDomain(domain);
    }
    public List<User> getCredits() {
        return mcqRepository.findAllDistictCredits();
    }
}
