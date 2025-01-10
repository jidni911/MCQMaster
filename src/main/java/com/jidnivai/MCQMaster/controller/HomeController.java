package com.jidnivai.MCQMaster.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.service.MCQService;
import com.jidnivai.MCQMaster.service.UserService;





@Controller("/")
public class HomeController {

    @Autowired
    MCQService mcqService;
    @Autowired
    UserService userService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("totalMCQ", mcqService.getTotalMCQ());
        
        model.addAttribute("users", userService.getAll());
        model.addAttribute("MCQs", mcqService.getDemoMCQ());
        model.addAttribute("user", new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","dev"));
       
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
