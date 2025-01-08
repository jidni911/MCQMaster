package com.jidnivai.MCQMaster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jidnivai.MCQMaster.entity.MCQ;

@Repository
public interface MCQRepository extends JpaRepository<MCQ,Long>{

    @Query(value = "SELECT * FROM mcq LIMIT 40", nativeQuery = true)
    public List<MCQ> findDemoMCQ();


}
