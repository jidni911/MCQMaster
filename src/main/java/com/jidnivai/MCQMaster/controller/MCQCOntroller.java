package com.jidnivai.MCQMaster.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "quizForm.jsp";
    }

    @PostMapping("/quiz")
    public String quizTaker (
        @RequestParam(required = false) Integer numQuestions,
        @RequestParam(required = false) String[] selectedDomains,
        @RequestParam(required = false) String[] selectedTopics,
        @RequestParam(required = false) Long[] selectedCredits,
        @RequestParam String quizMode,//learn,rapid,classic
        Model model
    ) {
        List<MCQ> mcqList = mcqService.getMcqListForQuiz(numQuestions,selectedDomains,selectedTopics,selectedCredits);
        model.addAttribute("mcqList", mcqList);
        switch (quizMode) {
            case "rapid":
                return "rapidQuizTaker.jsp";
            case "classic":
                return "classicQuizTaker.jsp";
            default:
                return "learnQuiz.jsp";
        }
    }
    
    // /mcq/submitQuiz
    @PostMapping("/submitQuiz")
    public String submitQuiz(@RequestParam Map<String, String> userAnswers, Model model) {
        // Iterate through the userAnswers map
        int correctAnswers = 0;
        int attemptedQuestions = 0;
        Map<MCQ, Byte> userMap = new HashMap<>();
        for (Map.Entry<String, String> entry : userAnswers.entrySet()) {
            Long questionId = Long.parseLong(entry.getKey()); // Question ID


            Byte selectedOption = null; 
            System.out.println(entry.getValue());
            if (!entry.getValue().isEmpty()) {
                attemptedQuestions++;
                selectedOption = Byte.parseByte(entry.getValue());
            }

            // Fetch the question text (or other metadata) for display purposes
            MCQ mcq = mcqService.getById(questionId); // Adjust your service method accordingly

            // Map the question text to the selected option
            userMap.put(mcq, selectedOption);
            if (selectedOption!=null) {
                if (mcq.getAnswers().equals(selectedOption.toString())) {
                    correctAnswers++;
                }
            }
        }

        // Add userMap (user-readable answers) to the model for use in the JSP
        model.addAttribute("totalQuestions", userMap.size());
        model.addAttribute("attemptedQuestions", attemptedQuestions);
        model.addAttribute("correctAnswers", correctAnswers);
        model.addAttribute("accuracy", correctAnswers*100.0/userMap.size());
        model.addAttribute("attemptAccuracy", correctAnswers*100.0/attemptedQuestions);
        model.addAttribute("attemptPercentage", attemptedQuestions*100/userAnswers.size());
        model.addAttribute("userAnswers", userMap);

        return "quizResult.jsp";
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

    @GetMapping("/credits")
    @ResponseBody
    public  List<String> getCreditsByTopicAndDomain(
        @RequestParam("domain") List<String> domains,
         @RequestParam("topic") List<String> topics
    ) {
        return mcqService.getCreditsByTopicAndDomain(domains,topics);
    }
    
    
}
