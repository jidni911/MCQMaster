package com.jidnivai.MCQMaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/test")
public class TestController {

    @GetMapping("/create")
    public String getMethodName() {
        return "quiz/create.jsp";
    }
    
}
