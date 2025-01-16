package com.jidnivai.MCQMaster.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.User;
import com.jidnivai.MCQMaster.entity.Option;
import com.jidnivai.MCQMaster.repository.MCQRepository;
import com.jidnivai.MCQMaster.repository.UserRepository;

@Service
public class MCQService {

    @Autowired
    MCQRepository mcqRepository;
    @Autowired
    UserRepository userRepository;

    public MCQ getById(Long id){
        return mcqRepository.findById(id).get();
    }
    public Long getTotalMCQ(){
        return mcqRepository.count();
    }
    public void saveMCQ(MCQ mcq) {
        mcqRepository.save(mcq);
    }
    public List<MCQ> getDemoMCQ() {
        return mcqRepository.findDemoMCQ();
    }
    public List<String> getDomains() {
        return mcqRepository.findAllDistictDomains();
    }
    public List<String> getTopicsByDomain(List<String> domain) {
        return mcqRepository.findTopicsByDomain(domain);
    }
    public List<User> getCredits() {
        return mcqRepository.findAllDistictCredits();
    }
    public List<String> getCreditsByTopicAndDomain(List<String> domains, List<String> topics) {
        List<User> creditList = mcqRepository.CreditsByTopicAndDomain(domains,topics);
        List<String> credits = new ArrayList<>();

        for (User credit : creditList) {
            int s = 0;
            for (MCQ mcq : credit.getMcqs()) {
                if(domains.contains(mcq.getDomain()) && topics.contains(mcq.getTopic())){
                    s++;
                }
            }
            credits.add(credit.getId()+","+credit.getName()+","+s);
        }
        return credits;
    }

    public void generateMCQs() {
        List<MCQ> mcqs = new ArrayList<>();

        String[] domains = {
            "Science", "History", "Geography", "Mathematics", "Technology",
            "Arts", "Sports", "Literature", "Physics", "Biology"
        };

        String[] topics = {
            "Physics Basics", "Chemistry Fundamentals", "World Wars", "Continents", "Geometry",
            "Programming", "Modern Art", "Football", "Shakespeare", "Human Anatomy",
            "Thermodynamics", "Periodic Table", "Historical Figures", "Oceans", "Algebra",
            "Machine Learning", "Classical Music", "Olympics", "Poetry", "Genetics",
            "Quantum Mechanics", "Chemical Reactions", "Ancient Civilizations", "Mountains", "Calculus",
            "Cybersecurity", "Renaissance", "Cricket", "Novels", "Microbiology",
            "Relativity", "Elements", "Medieval History", "Rivers", "Trigonometry",
            "Artificial Intelligence", "Painting", "Basketball", "Plays", "Ecology",
            "Optics", "Materials", "Industrial Revolution", "Deserts", "Statistics"
        };

        String[] questions = new String[200];
        for (int i = 0; i < 200; i++) {
            questions[i] = "Question " + (i + 1) + ": Describe the significance of topic in domain.";
        }

        List<User> users = userRepository.findAll();

        int domainIndex = 0;
        int topicIndex = 0;

        for (int i = 0; i < questions.length; i++) {
            MCQ mcq = new MCQ();
            mcq.setQuestion(questions[i]);

            // Cycle through topics and domains
            mcq.setTopic(topics[topicIndex]);
            mcq.setDomain(domains[domainIndex]);

            // Increment indices for cycling through topics and domains
            topicIndex = (topicIndex + 1) % topics.length;
            if (topicIndex == 0) {
                domainIndex = (domainIndex + 1) % domains.length;
            }

            // Assign a random user as the credit
            mcq.setCredit(users.get(i % users.size()));

            // Generate options
            List<Option> options = new ArrayList<>();
            for (byte j = 1; j <= 4; j++) {
                Option option = new Option();
                option.setSerial(j);
                option.setText("Option " + j + " for " + mcq.getQuestion());
                option.setMcq(mcq);
                options.add(option);
            }
            mcq.setOptions(options);

            // Set a correct answer
            mcq.setAnswers("Option 1");

            mcqs.add(mcq);
        }

        mcqRepository.saveAll(mcqs);
    }
    public List<MCQ> getMcqListForQuiz(Integer numQuestions, String[] selectedDomains, String[] selectedTopics,
            Long[] selectedCredits) {
                int c =  mcqRepository.countAllForQuiz(selectedDomains,selectedTopics,selectedCredits);
                if(numQuestions==null||numQuestions>c){
                    numQuestions = c;
                }
                return mcqRepository.findAllForQuiz(numQuestions,selectedDomains,selectedTopics,selectedCredits);
    }
    public List<MCQ> getAll() {
        return mcqRepository.findAll();
    }
    public void deleteById(Long id) {
        mcqRepository.deleteById(id);
    }
   
    public List<MCQ> searchMCQs(String domain, String topic, String credit) {
         return mcqRepository.searchMCQs(domain, topic, credit);
    }
}
