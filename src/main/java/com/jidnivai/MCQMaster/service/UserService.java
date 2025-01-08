package com.jidnivai.MCQMaster.service;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

    public List<User> getAll() {
        return userRepository.findAll();
    }
    public User getById(Long id){
        return userRepository.findById(id).get();
    }

    public void generateRandomUsers(int count) {
        List<User> users = new ArrayList<>();
        Random random = new Random();

        String[] names = {"John Doe", "Jane Smith", "Alice Johnson", "Bob Brown", "Charlie Davis"};
        String[] emails = {"john.doe@example.com", "jane.smith@example.com", "alice.johnson@example.com", 
                           "bob.brown@example.com", "charlie.davis@example.com"};
        String[] passwords = {"password123", "securePass!9", "qwerty123", "password987", "myPass2021"};
        String[] roles = {"USER", "ADMIN"};
        String[] images = {
            "https://example.com/images/john.jpg",
            "https://example.com/images/jane.jpg",
            "https://example.com/images/alice.jpg",
            "https://example.com/images/bob.jpg",
            "https://example.com/images/charlie.jpg"
        };

        for (int i = 0; i < count; i++) {
            User user = new User();
            user.setId(null);
            user.setName(names[random.nextInt(names.length)]);
            user.setEmail(emails[random.nextInt(emails.length)] + i); // Add unique suffix to avoid duplicates
            user.setPassword(passwords[random.nextInt(passwords.length)]);
            user.setDob(LocalDate.of(1980 + random.nextInt(30), 1 + random.nextInt(12), 1 + random.nextInt(28)));
            user.setImage(images[random.nextInt(images.length)]);
            user.setRole(roles[random.nextInt(roles.length)]);
            users.add(user);
        }

        userRepository.saveAll(users);
    }
}
