package com.jidnivai.MCQMaster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.Result;
import com.jidnivai.MCQMaster.repository.ResultRepository;

@Service
public class ResultService {
    
    @Autowired
    ResultRepository resultRepository;

    public Result add(Result result) {
        return resultRepository.save(result);
    }

    public List<Result> getAll() {
        return resultRepository.findAll();
    }

    public Result getById(Long id) {
        return resultRepository.findById(id).get();
    }
}
