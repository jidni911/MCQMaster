package com.jidnivai.MCQMaster.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jidnivai.MCQMaster.entity.Test;
import com.jidnivai.MCQMaster.service.TestService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;




@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    TestService testService;

    @GetMapping("/create")
    public String createForm(Model model) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        String formattedTime = LocalDateTime.now().format(formatter);
        model.addAttribute("time", formattedTime);
        return "test/create.jsp";
    }

    @PostMapping("/create")
    public String createFormPost(
        @RequestParam String name,
        @RequestParam String maker,
        @RequestParam String[] mcqs

    ){
        
        return "redirect:/test/viewQuestions/"+testService.generatetestAndSave(name,maker,mcqs).getId();
    }

    @GetMapping("/viewQuestions/{id}")
    public String viewQuestions(
        @PathVariable Long id,
        Model model
    ){
        Test test = testService.getById(id);
        model.addAttribute("test", test);
        return "test/viewTest.jsp";
    }
    

    @PostMapping("/attempt")
    public String attempt(@RequestParam String testCode, Model model) {
        Test test = testService.getById(Long.parseLong(testCode));
        model.addAttribute("test", test);
        // switch (quizMode) { TODO
        //     case "rapid":
        //         return "rapidQuizTaker.jsp";
        //     case "classic":
        //         return "classicQuizTaker.jsp";
        //     default:
        //         return "learnQuiz.jsp";
        // }
        
        return "classicQuizTaker.jsp";
    }
    @GetMapping("/retake/{testCode}")
    public String retake(@PathVariable String testCode, Model model) {
        Test test = testService.getById(Long.parseLong(testCode));
        model.addAttribute("test", test);
        return "classicQuizTaker.jsp";
    }

    @GetMapping("/viewSubmits/{id}")
    public String viewSubmits(@PathVariable String id, Model model) {
        // model.addAttribute("", testService.getById(Long.parseLong(id)))
        return "";
    }
    
}
