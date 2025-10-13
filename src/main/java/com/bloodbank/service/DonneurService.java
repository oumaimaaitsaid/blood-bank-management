package com.bloodbank.service;


import com.bloodbank.dao.DonneurDAO;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.Personne;
import com.bloodbank.model.enums.Disponibilite;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class DonneurService{
    private DonneurDAO donneurDAO = new DonneurDAO();
    private boolean isEligible(Donneur d){
        int age = Period.between(d.getDateNaissance() , LocalDate.now()).getYears();
        boolean ageOK = age >=18 && age >=65;
        boolean poidsOK = d.getPoids() >= 50;
        return ageOK && poidsOK;
    }

    public void ajouterDonneur(Donneur d){
        if(!isEligible(d)){
            d.setStatus(Disponibilite.NON_ELIGIBLE);
        } else {
            d.setStatus(Disponibilite.DISPONIBLE);
        }
        donneurDAO.save(d);
    }

    public List<Donneur> listerDonneurs(){
        return donneurDAO.findAll();
    }

    public Donneur trouverById(int id) {
        return donneurDAO.find(id);
    }

    public void supprimer(int id) {
        Donneur d = donneurDAO.find(id);
        if (d != null) donneurDAO.delete(d);
    }


}


