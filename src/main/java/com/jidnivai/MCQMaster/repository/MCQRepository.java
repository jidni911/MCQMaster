package com.jidnivai.MCQMaster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jidnivai.MCQMaster.entity.MCQ;
import com.jidnivai.MCQMaster.entity.User;

@Repository
public interface MCQRepository extends JpaRepository<MCQ,Long>{

    @Query(value = "SELECT * FROM mcq LIMIT 40", nativeQuery = true)
    public List<MCQ> findDemoMCQ();

    @Query(value = "SELECT DISTINCT m.domain FROM MCQ m")
    public List<String> findAllDistictDomains();

    @Query("SELECT DISTINCT m.topic FROM MCQ m WHERE m.domain IN :domains")
    List<String> findTopicsByDomain(@Param("domains") List<String> domains);

    @Query("SELECT DISTINCT u FROM User u JOIN u.mcqs m")
    public List<User> findAllDistictCredits();

    @Query("SELECT DISTINCT u FROM User u JOIN u.mcqs m WHERE m.domain IN :domains AND m.topic IN :topics")
    public List<User> CreditsByTopicAndDomain(@Param("domains") List<String> domains, @Param("topics") List<String> topics);

    @Query("""
        SELECT m FROM MCQ m 
        WHERE (:selectedDomains IS NULL OR m.domain IN :selectedDomains)
          AND (:selectedTopics IS NULL OR m.topic IN :selectedTopics)
          AND (:selectedCredits IS NULL OR m.credit.id IN :selectedCredits)
        ORDER BY FUNCTION('RAND') LIMIT :numQuestions
    """)
    public List<MCQ> findAllForQuiz(Integer numQuestions, String[] selectedDomains, String[] selectedTopics,
            Long[] selectedCredits);

    @Query("""
        SELECT COUNT(m) FROM MCQ m 
        WHERE (:selectedDomains IS NULL OR m.domain IN :selectedDomains)
          AND (:selectedTopics IS NULL OR m.topic IN :selectedTopics)
          AND (:selectedCredits IS NULL OR m.credit.id IN :selectedCredits)
        ORDER BY FUNCTION('RAND')
    """)
    public int countAllForQuiz(String[] selectedDomains, String[] selectedTopics, Long[] selectedCredits);

    



}
