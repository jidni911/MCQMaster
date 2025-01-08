package com.jidnivai.MCQMaster.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.Option;
import com.jidnivai.MCQMaster.service.MCQService;
import com.jidnivai.MCQMaster.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
@RequestMapping(value = "/mcq")
public class MCQCOntroller {

    @Autowired
    MCQService mcqService;
    @Autowired
    UserService userService;

    @GetMapping("/create")
    public String createMCQ(
        Model model,
        @RequestParam(required = false,defaultValue = "false") String success,
        @RequestParam(required = false,defaultValue = "") String domain,
        @RequestParam(required = false,defaultValue = "") String topic
        ) {

        Boolean showSuccessMessege = false;
        if (!success.equals(null)) {
            showSuccessMessege = success.equals("true");   
        }
        Long id = 1L;//TODO get id
        model.addAttribute("user", userService.getById(id));
        model.addAttribute("showSuccessMessege", showSuccessMessege);
        model.addAttribute("domain", domain);
        model.addAttribute("topic", topic);
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
        MCQ mcq = new MCQ();
        mcq.setQuestion(question);
        // mcq.setCredit( new User(1L,"demo user","demo@email.com","123123",LocalDate.now(),"img.png","user"));
        // mcqService.saveMCQ(mcq);
        List<Option> options2 = new ArrayList<>();
        for (int i = 0; i < options.length; i++) {
            Option option  = new Option();
            option.setSerial((byte) (i+1));
            option.setText(options[i]);
            option.setMcq(mcq);
            options2.add(option);
        }

        mcq.setOptions(options2);
        mcq.setAnswers(answers);
        mcq.setCredit(userService.getById(credit));
        mcq.setTopic(topic);
        mcq.setDomain(domain);

        System.out.println(mcq);
        mcqService.saveMCQ(mcq);
        return "redirect:/mcq/create?success=true&domain="+domain+"&topic="+topic;
    }

    
    
    
    @GetMapping("/quiz")
    public String takeQuiz(Model model) {
        Long id = 1L;//TODO get from request 
        model.addAttribute("user", userService.getById(id));
        model.addAttribute("domains", mcqService.getDomains());
        model.addAttribute("credits", mcqService.getCredits());
        return "quizForm.jsp";
    }

    @PostMapping("/quiz")
    public String quizTaker (
        @RequestParam Integer numQuestions,
        @RequestParam String[] selectedDomains,
        @RequestParam String[] selectedTopics,
        @RequestParam Long[] selectedCredits
    ) {
        // return "quizeTaker.jsp";
        System.out.println(numQuestions);
        System.out.println(selectedDomains);
        System.out.println(selectedTopics);
        System.out.println(selectedCredits);
        return "quizForm.jsp";
    }
    

    @GetMapping("/domains")
    @ResponseBody
    public List<String> getDistinctDomains() {
        return mcqService.getDomains();
    }

    @GetMapping("/topics")
    @ResponseBody
    public List<String> getTopicsByDomain(@RequestParam("domain") List<String> domains) {
        return mcqService.getTopicsByDomain(domains);
    }
    
}
