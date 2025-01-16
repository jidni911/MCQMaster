package com.jidnivai.MCQMaster.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
public class MCQ {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String question;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "mcq")
    private List<Option> options;

    @ManyToMany
    @JoinTable(
        name = "mcq_test",
        joinColumns = @JoinColumn(name = "mcq_id"),
        inverseJoinColumns = @JoinColumn(name = "test_id")
    )
    @JsonIgnore
    private List<Test> tests;

    private String answers;

    @ManyToOne
    @JoinColumn(name = "USER_ID", referencedColumnName = "id", nullable = false)
    private User credit;

    private String topic;
    private String domain;
}
