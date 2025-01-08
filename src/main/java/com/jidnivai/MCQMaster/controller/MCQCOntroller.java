package com.jidnivai.MCQMaster.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.Option;
import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.service.MCQService;
import com.jidnivai.MCQMaster.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping(value = "/mcq")
public class MCQCOntroller {

    @Autowired
    MCQService mcqService;
    @Autowired
    UserService userService;

    @GetMapping("/create")
    public String createMCQ(Model model) {
        model.addAttribute("user", new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","user"));
        return "createMCQ.jsp";
    }

    @PostMapping("/create")
    public String saveMCQ(
        @RequestParam String question,
        @RequestParam String[] options,
        @RequestParam(required = false) String answers,
        @RequestParam Long credit,
        @RequestParam String topic,
        @RequestParam String domain


    ) {
        // mcq.setCredit( new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","user"));
        // mcqService.saveMCQ(mcq);
        List<Option> options2 = new ArrayList<>();
        for (int i = 0; i < options.length; i++) {
            Option option  = new Option();
            option.setSerial((byte) (i+1));
            option.setText(options[i]);
            options2.add(option);
        }
        MCQ mcq = new MCQ();
        mcq.setQuestion(question);
        mcq.setOptions(options2);
        mcq.setAnswers(answers);
        mcq.setCredit(userService.getById(credit));
        mcq.setTopic(topic);
        mcq.setDomain(domain);

        // System.out.println(mcq);
        mcqService.saveMCQ(mcq);
        return "redirect:/mcq/create?success=true";
    }
    
}
