package com.jidnivai.MCQMaster.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jidnivai.MCQMaster.entity.Test;

@Repository
public interface TestRepository extends JpaRepository<Test,Long>{

    // User findByEmail(String email);
}
