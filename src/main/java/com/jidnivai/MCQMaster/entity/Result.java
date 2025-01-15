package com.jidnivai.MCQMaster.entity;

import java.io.IOException;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.HashMap;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @ToString.Exclude
    @JoinColumn(name = "TAKER_ID", referencedColumnName = "id", nullable = false)
    private User taker;

    @Lob
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    private String userAnswersJson; // Stored as JSON in the database

    @ManyToOne
    @ToString.Exclude
    @JoinColumn(name = "TEST_ID", referencedColumnName = "id", nullable = false)
    private Test test;

    private Integer successCount;

    public Map<Long, Byte> getUserAnswers() {
        if (userAnswersJson == null || userAnswersJson.isEmpty()) {
            return new HashMap<>(); // Return an empty mutable map if no answers are set
        }
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.readValue(userAnswersJson, new TypeReference<Map<Long, Byte>>() {});
        } catch (IOException e) {
            throw new RuntimeException("Failed to parse userAnswersJson: " + e.getMessage(), e);
        }
    }

    public void setUserAnswers(Map<MCQ, Byte> userAnswers) {
        if (userAnswers == null || userAnswers.isEmpty()) {
            this.userAnswersJson = null; // Store null if the map is null/empty
            return;
        }
        ObjectMapper objectMapper = new ObjectMapper();
        Map<Long,Byte> temp = new HashMap<>();
        for (Map.Entry<MCQ, Byte> entry : userAnswers.entrySet()) {
            temp.put(entry.getKey().getId(), entry.getValue());
        }
        try {
            this.userAnswersJson = objectMapper.writeValueAsString(temp);
        } catch (IOException e) {
            throw new RuntimeException("Failed to convert userAnswers to JSON: " + e.getMessage(), e);
        }
    }
}
