package com.bloodbank.model;

import com.bloodbank.model.enums.Disponibilite;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class Donneur extends Personne{

   private double poids;


   @Enumerated(EnumType.STRING)
    private Disponibilite status =Disponibilite.DISPONIBLE;

   private LocalDate dateDernierDon;

    @ManyToMany
    @JoinTable(
            name = "donneur_condition",
            joinColumns = @JoinColumn(name = "donneur_id"),
            inverseJoinColumns = @JoinColumn(name = "condition_id")
    )

    private List<MedicalCondition> medicalConditions;






}
