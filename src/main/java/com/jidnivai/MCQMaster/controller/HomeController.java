package com.jidnivai.MCQMaster.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jidnivai.MCQMaster.service.MCQService;
import com.jidnivai.MCQMaster.service.ResultService;
import com.jidnivai.MCQMaster.service.TestService;
import com.jidnivai.MCQMaster.service.UserService;





@Controller("/")
public class HomeController {

    @Autowired
    MCQService mcqService;
    @Autowired
    UserService userService;
    @Autowired
    TestService testService;
    @Autowired 
    ResultService resultService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("date", "2025");
        model.addAttribute("totalMCQ", mcqService.getTotalMCQ());
        model.addAttribute("totalSubmits", resultService.getTotalSubmits());
        model.addAttribute("totalTests", testService.getTotalTests());
        
        model.addAttribute("users", userService.getAll());
        model.addAttribute("MCQs", mcqService.getDemoMCQ());
       
        model.addAttribute("userTotalMcqs", 20);
        model.addAttribute("userTestsTaken", 5);
        model.addAttribute("userReportedMcqs", 3);
        model.addAttribute("userMcqsAttempted", 15);
        model.addAttribute("userAverageScore", 75);

        model.addAttribute("totalUsers", 500);
        model.addAttribute("activeUsers", 450);
        model.addAttribute("bannedUsers", 10);
        model.addAttribute("suspendedUsers", 15);
        model.addAttribute("totalMcqs", 300);
        model.addAttribute("deletedMcqs", 20);
        model.addAttribute("totalReportedMcqs", 30);

        model.addAttribute("websiteUptime", 99.5);
        model.addAttribute("responseTime", 300);
        model.addAttribute("activeRoles", 5);
        model.addAttribute("totalRequests", 150000);
        model.addAttribute("totalErrors", 50);
        model.addAttribute("monthlyVisitors", 25000);
        model.addAttribute("bounceRate", 45);

        model.addAttribute("tests", testService.getAll());
        return "index.jsp";
    }

    @GetMapping("/generateTestUsers")
    public String getMethodName() {
        userService.generateRandomUsers(20);
        return "redirect:/";
    }
    @GetMapping("/generateTestMCQs")
    public String getMethodName2() {
        mcqService.generateMCQs();
        return "redirect:/";
    }
    
    
}
