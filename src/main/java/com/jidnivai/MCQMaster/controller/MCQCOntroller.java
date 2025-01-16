package com.jidnivai.MCQMaster.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.Option;
import com.jidnivai.MCQMaster.entity.Result;
import com.jidnivai.MCQMaster.entity.Test;
import com.jidnivai.MCQMaster.service.MCQService;
import com.jidnivai.MCQMaster.service.ResultService;
import com.jidnivai.MCQMaster.service.TestService;
import com.jidnivai.MCQMaster.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping(value = "/mcq")
public class MCQCOntroller {

    @Autowired
    MCQService mcqService;
    @Autowired
    UserService userService;
    @Autowired
    TestService testService;
    @Autowired
    ResultService resultService;

    @GetMapping("/create")
    public String createMCQ(
            Model model,
            @RequestParam(required = false, defaultValue = "false") String success,
            @RequestParam(required = false, defaultValue = "") String domain,
            @RequestParam(required = false, defaultValue = "") String topic) {

        Boolean showSuccessMessege = false;
        if (!success.equals(null)) {
            showSuccessMessege = success.equals("true");
        }
        model.addAttribute("showSuccessMessege", showSuccessMessege);
        model.addAttribute("domain", domain);
        model.addAttribute("topic", topic);
        return "createMCQ.jsp";
    }

// }

    @PostMapping("/create")
    public String saveMCQ(
            @RequestParam String question,
            @RequestParam String[] options,
            @RequestParam(required = false) String answers,
            @RequestParam Long credit,
            @RequestParam String topic,
            @RequestParam String domain) {
        MCQ mcq = new MCQ();
        mcq.setQuestion(question);
        List<Option> options2 = new ArrayList<>();
        for (int i = 0; i < options.length; i++) {
            Option option = new Option();
            option.setSerial((byte) (i + 1));
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
        return "redirect:/mcq/create?success=true&domain=" + domain + "&topic=" + topic;
    }

    @GetMapping("/quiz")
    public String takeQuiz(Model model) {
        Long id = 1L;// TODO get from request
        model.addAttribute("user", userService.getById(id));
        model.addAttribute("domains", mcqService.getDomains());
        return "quizForm.jsp";
    }

    @PostMapping("/quiz")
    public String quizTaker(
            @RequestParam String userId,
            @RequestParam(required = false) Integer numQuestions,
            @RequestParam(required = false) String[] selectedDomains,
            @RequestParam(required = false) String[] selectedTopics,
            @RequestParam(required = false) Long[] selectedCredits,
            @RequestParam String quizMode, // learn,rapid,classic
            Model model) {
        List<MCQ> mcqList = mcqService.getMcqListForQuiz(numQuestions, selectedDomains, selectedTopics,
                selectedCredits);
        Test test = new Test();
        test.setMaker(userService.getById(Long.parseLong(userId)));
        test.setName("Self");
        test.setTime(LocalDateTime.now());
        test.setMcqs(mcqList);
        test = testService.add(test);
        model.addAttribute("test", test);
        switch (quizMode) {
            case "rapid":
                return "rapidQuizTaker.jsp";
            case "classic":
                return "classicQuizTaker.jsp";
            default:
                return "learnQuiz.jsp";
        }
    }

    @GetMapping("/viewResult/{id}")
    public String getMethodName(@PathVariable Long id, Model model) {

        Result result = resultService.getById(id);

        int correctAnswers = 0;
        int attemptedQuestions = 0;
        int totalQuestion = 0;
        Map<MCQ, Byte> userMap = new HashMap<>();
        for (Map.Entry<Long, Byte> entry : result.getUserAnswers().entrySet()) {
            
            totalQuestion++;
            Long questionId = entry.getKey(); // Question ID

            Byte selectedOption = null;
            if (entry.getValue()!=null) {
                attemptedQuestions++;
                selectedOption = entry.getValue();
            }

            // Fetch the question text (or other metadata) for display purposes
            MCQ mcq = mcqService.getById(questionId); // Adjust your service method accordingly

            // Map the question text to the selected option
            userMap.put(mcq, selectedOption);
            if (selectedOption != null) {
                if (mcq.getAnswers()!=null && mcq.getAnswers().equals(selectedOption.toString())) {
                    correctAnswers++;
                }
            }
        }

        model.addAttribute("totalQuestions", result.getUserAnswers().size());
        model.addAttribute("result", result);
        model.addAttribute("attemptedQuestions", attemptedQuestions);
        model.addAttribute("correctAnswers", correctAnswers);
        model.addAttribute("accuracy", correctAnswers * 100.0 / userMap.size());
        model.addAttribute("attemptAccuracy", correctAnswers * 100.0 / attemptedQuestions);
        model.addAttribute("attemptPercentage", attemptedQuestions * 100 / totalQuestion);
        Map<MCQ, Byte> modifiedAnswer = new HashMap<>();
        for (Map.Entry<Long, Byte> entry : result.getUserAnswers().entrySet()) {
            modifiedAnswer.put(mcqService.getById(entry.getKey()), entry.getValue());
        }
        model.addAttribute("userAnswers", modifiedAnswer);
        return "quizResult.jsp";
    }

    // /mcq/submitQuiz
    @PostMapping("/submitQuiz")
    public String submitQuiz(
        @RequestParam String userId,
            @RequestParam String testID,
            @RequestParam Map<String, String> userAnswers,
            Model model) {
        Result result = new Result();
        result.setTaker(userService.getById(Long.parseLong(userId)));
        result.setTest(testService.getById(Long.parseLong(testID)));

        // Iterate through the userAnswers map
        int correctAnswers = 0;
        int attemptedQuestions = 0;
        Map<MCQ, Byte> userMap = new HashMap<>();
        for (Map.Entry<String, String> entry : userAnswers.entrySet()) {
            if (entry.getKey().equals("testID") || entry.getKey().equals("userId")) {
                continue;
            }
            Long questionId = Long.parseLong(entry.getKey()); // Question ID

            Byte selectedOption = null;
            if (!entry.getValue().isEmpty()) {
                attemptedQuestions++;
                selectedOption = Byte.parseByte(entry.getValue());
            }

            // Fetch the question text (or other metadata) for display purposes
            MCQ mcq = mcqService.getById(questionId); // Adjust your service method accordingly

            // Map the question text to the selected option
            userMap.put(mcq, selectedOption);
            if (selectedOption != null) {
                if (mcq.getAnswers()!=null &&  mcq.getAnswers().equals(selectedOption.toString())) {
                    correctAnswers++;
                }
            }
        }
        result.setSuccessCount(correctAnswers);
        result.setAttemptCount(attemptedQuestions);
        result.setUserAnswers(userMap);
        result = resultService.add(result);

       
       

        return "redirect:/mcq/viewResult/"+result.getId();
    }

    @GetMapping("/manage")
    public String manageMCQ(
            Model model,
            @RequestParam(required = false) String delete,
            @RequestParam(required = false) String update) {
        if (delete != null && delete.equals("success")) {
            model.addAttribute("showDeleteSuccess", "yes");
        } else {
            model.addAttribute("showDeleteSuccess", "no");
        }
        if (update != null && update.equals("success")) {
            model.addAttribute("showUpdateSuccess", "yes");
        } else {
            model.addAttribute("showUpdateSuccess", "no");
        }
        // TODO get role
        List<MCQ> mcqs = mcqService.getAll();
        model.addAttribute("mcqList", mcqs);
        return "mcqManager.jsp";
    }

    @GetMapping("/delete/{id}")
    public String deleteMCQ(Model model, @PathVariable Long id) {
        // TODO get role
        mcqService.deleteById(id);
        return "redirect:/mcq/manage?delete=success";
    }

    @GetMapping("/edit/{id}")
    public String editMCQ(Model model, @PathVariable Long id) {
        // TODO get role
        MCQ mcq = mcqService.getById(id);
        model.addAttribute("mcq", mcq);
        return "editMCQ.jsp";
    }

    @PostMapping("/edit")
    public String submitEdit(
            @RequestParam(required = false) Long id,
            @RequestParam String question,
            @RequestParam String[] options,
            @RequestParam(required = false) String answers,
            @RequestParam Long credit,
            @RequestParam String topic,
            @RequestParam String domain) {
        MCQ mcq = new MCQ();
        mcq.setId(id);
        mcq.setQuestion(question);
        List<Option> oldOptions = mcqService.getById(id).getOptions();
        List<Option> newOptions = new ArrayList<>();
        for (int i = 0; i < options.length; i++) {
            Option option;
            if (i < oldOptions.size()) {
                option = oldOptions.get(i);
            } else {
                option = new Option();
            }
            option.setSerial((byte) (i + 1));
            option.setText(options[i]);
            option.setMcq(mcq);
            newOptions.add(option);
        }

        mcq.setOptions(newOptions);
        mcq.setAnswers(answers);
        mcq.setCredit(userService.getById(credit));
        mcq.setTopic(topic);
        mcq.setDomain(domain);
        mcqService.saveMCQ(mcq);
        return "redirect:/mcq/manage?update=success";
    }

    @GetMapping("/results")
    public String getUserResults(Model model) {
        model.addAttribute("results", resultService.getAll());
        // resultService.getAll().get(0).getUserAnswers().values().size()
        return "userResult.jsp";
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
    public List<String> getCreditsByTopicAndDomain(
            @RequestParam("domain") List<String> domains,
            @RequestParam("topic") List<String> topics) {
        return mcqService.getCreditsByTopicAndDomain(domains, topics);
    }

    @GetMapping("/search")
    @ResponseBody
    public List<MCQ> searchMCQs(
            @RequestParam(required = false) String domain,
            @RequestParam(required = false) String topic,
            @RequestParam(required = false) String credit) {
        return mcqService.searchMCQs(domain, topic, credit);
    }


}
