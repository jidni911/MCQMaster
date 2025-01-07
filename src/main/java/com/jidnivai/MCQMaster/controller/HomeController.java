package com.jidnivai.MCQMaster.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.service.MCQService;




@Controller("/")
public class HomeController {

    @Autowired
    MCQService mcqService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("totalMCQ", mcqService.getTotalMCQ());
        model.addAttribute("user", new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","user"));
        return "index.jsp";
    }
    

}
