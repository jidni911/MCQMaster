package com.jidnivai.MCQMaster.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.repository.UserRepository;

@Service
public class UserService {
    
    @Autowired
    UserRepository userRepository;

    public void signup(User user){
        userRepository.save(user);   
    }

    public User login(String mail, String pass) {
        User user = userRepository.findByEmail(mail);
        if (user.getPassword().equals(pass)){
            return user;
        } else {
            return null;
        }

    }
}
