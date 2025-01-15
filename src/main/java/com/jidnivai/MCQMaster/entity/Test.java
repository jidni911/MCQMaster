package com.jidnivai.MCQMaster.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
public class Test {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @ToString.Exclude
    @JoinColumn(name="MAKER_ID", referencedColumnName = "id", nullable = false)
    private User maker;

    @ManyToMany(mappedBy = "tests")
    private List<MCQ> mcqs;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "test")
    @ToString.Exclude
    private List<Result> results;
}