package com.jidnivai.MCQMaster.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.Test;
import com.jidnivai.MCQMaster.repository.TestRepository;

@Service
public class TestService {
    @Autowired
    TestRepository testRepository;

    public Test add(Test test) {
        return testRepository.save(test);
    }

    public Test getById(Long testID) {
        return testRepository.findById(testID).get();
    }
}
