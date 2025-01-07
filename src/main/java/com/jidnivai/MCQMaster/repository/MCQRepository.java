package com.jidnivai.MCQMaster.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jidnivai.MCQMaster.entity.MCQ;

@Repository
public interface MCQRepository extends JpaRepository<MCQ,Long>{

}
