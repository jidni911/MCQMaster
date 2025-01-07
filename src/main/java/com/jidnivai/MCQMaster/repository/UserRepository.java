package com.jidnivai.MCQMaster.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.jidnivai.MCQMaster.entity.User;

public interface UserRepository extends JpaRepository<User,Long>{

    User findByEmail(String email);
}
