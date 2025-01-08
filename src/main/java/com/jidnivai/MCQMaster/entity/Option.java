package com.jidnivai.MCQMaster.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "options")
public class Option {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Byte serial;
    private String text;

    @ManyToOne
    @JoinColumn(name = "MCQ_ID", referencedColumnName = "id")
    @ToString.Exclude
    @JsonIgnore
    private MCQ mcq;
}
