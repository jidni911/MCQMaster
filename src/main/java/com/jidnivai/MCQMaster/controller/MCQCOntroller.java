package com.jidnivai.MCQMaster.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.service.MCQService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping(value = "/mcq")
public class MCQCOntroller {

    @Autowired
    MCQService mcqService;

    @GetMapping("/create")
    public String createMCQ(Model model) {
        model.addAttribute("user", new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","user"));
        return "createMCQ.jsp";
    }

    @PostMapping("/create")
    public String saveMCQ(@ModelAttribute MCQ mcq) {
        mcq.setCredit( new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","user"));
        mcqService.saveMCQ(mcq);
        return "redirect:/mcq/create?success=true";
    }
    
}
