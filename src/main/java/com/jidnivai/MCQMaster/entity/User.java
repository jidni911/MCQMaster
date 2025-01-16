package com.jidnivai.MCQMaster.entity;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    @Column(unique = true, nullable = false)
    private String email;
    private String password;
    private LocalDate dob;

    @OneToOne
    @JoinColumn(name = "profile_picture_id", referencedColumnName = "id")
    @ToString.Exclude
    @JsonIgnore
    private Image profilePicture;
    private String role;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "credit")
    @ToString.Exclude
    @JsonIgnore
    private List<MCQ> mcqs;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @ToString.Exclude
    private List<Token> tokens;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maker")
    @ToString.Exclude
    @JsonIgnore
    private List<Test> tests;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "taker")
    @ToString.Exclude
    @JsonIgnore
    private List<Result> results;


    public User(Long id, String name, String email, String password, LocalDate dob, Image profilePicture, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.profilePicture = profilePicture;
        this.role = role;
    }
     public User(){}
}
