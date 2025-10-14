package com.bloodbank.model;


import javax.persistence.*;

@Entity
public class MedicalCondition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true, nullable = false)
    private String name;


    public MedicalCondition() {}
    public MedicalCondition(String name) {
        this.name = name;
    }


    // ----------Getters & Setters --------
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}