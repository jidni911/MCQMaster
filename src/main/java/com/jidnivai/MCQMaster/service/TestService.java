package com.jidnivai.MCQMaster.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.Test;
import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.repository.TestRepository;

@Service
public class TestService {
    @Autowired
    TestRepository testRepository;
    @Autowired
    UserService userService;
    @Autowired
    MCQService mcqService;

    public Test add(Test test) {
        return testRepository.save(test);
    }

    public Test getById(Long testID) {
        return testRepository.findById(testID).get();
    }

    public List<Test> getAll(){
        return testRepository.findAll();
    }

    public Test generatetestAndSave(String name, String maker, String[] mcqs) {
        Test test = new Test();
        test.setName(name);
        test.setTime(LocalDateTime.now());
        test.setMaker(userService.getById(Long.parseLong(maker)));
        List<MCQ> mcqList = new ArrayList<>();
        for (int i = 0; i < mcqs.length; i++) {
            mcqList.add(mcqService.getById(Long.parseLong(mcqs[i])));
        }
        test.setMcqs(mcqList);
        return testRepository.save(test);
    }

    public Long getTotalTests() {
        return testRepository.count();
    }
}
