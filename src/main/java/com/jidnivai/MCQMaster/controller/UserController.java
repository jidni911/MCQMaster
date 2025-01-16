package com.jidnivai.MCQMaster.controller;

import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jidnivai.MCQMaster.entity.Image;
import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.service.MCQService;
import com.jidnivai.MCQMaster.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    MCQService mcqService;

    @GetMapping("/login")
    public String login() {
        return "login.jsp";
    }

    @PostMapping("/login")
    public String setUser(
        @RequestParam String logginginMail,
        @RequestParam String logginginPassword,
        @RequestParam(required = false) String rememberMe,
        Model model) {
            if(rememberMe==null){
                rememberMe = "no";
            }
        User loggedinUser = userService.login(logginginMail,logginginPassword);
        if( loggedinUser!=null){
            model.addAttribute("totalMCQ", mcqService.getTotalMCQ());
            model.addAttribute("user", loggedinUser);
            model.addAttribute("rememberMe", rememberMe);
            return "index.jsp";
            
        } else {
            model.addAttribute("messege","incorrect email or password");
            return "login.jsp";
        }
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup.jsp";
    }

    @PostMapping("/signup")
    public String addUser(
        @RequestParam String name,
        @RequestParam String email,
        @RequestParam String password,
        @RequestParam String dob,
        @RequestParam MultipartFile image,
        Model model
    ) {

   User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setDob(LocalDate.parse(dob));
        user.setRole("user");
        
        try {
            if (image != null && !image.isEmpty()) {
                
                Image profilePicture;
                profilePicture = userService.storeImage(image);
                user.setProfilePicture(profilePicture);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(userService.signup(user)==null){
            model.addAttribute("messege","email already exist");
            return "signup.jsp";
        }

        // Redirect to a success page
        return "redirect:/user/login";
    }

}
