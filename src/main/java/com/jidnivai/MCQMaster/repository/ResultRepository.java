package com.jidnivai.MCQMaster.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jidnivai.MCQMaster.entity.Result;

@Repository
public interface ResultRepository extends JpaRepository<Result,Long> {
    
}
