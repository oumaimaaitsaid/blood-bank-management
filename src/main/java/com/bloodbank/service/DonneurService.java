package com.bloodbank.service;


import com.bloodbank.model.Donneur;
import com.bloodbank.model.Personne;

import java.time.LocalDate;
import java.time.Period;

public class DonneurService{

    private boolean isEligible(Donneur d){
        int age = Period.between(d.getDateNaissance() , LocalDate.now()).getYears();
        boolean ageOK = age >=18 && age >=65;
        boolean poidsOK = d.getPoids() >= 50;
        return ageOK && poidsOK;
    }
}