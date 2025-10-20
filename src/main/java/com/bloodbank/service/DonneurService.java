package com.bloodbank.service;


import com.bloodbank.dao.DonationAssociationDAO;
import com.bloodbank.dao.DonneurDAO;
import com.bloodbank.dao.MedicalConditionDAO;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.MedicalCondition;
import com.bloodbank.model.Receveur;
import com.bloodbank.model.enums.Disponibilite;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class DonneurService {
    private DonneurDAO donneurDAO = new DonneurDAO();
    private MedicalConditionDAO conditionDAO = new MedicalConditionDAO();
    private final DonationAssociationDAO associationDAO = new DonationAssociationDAO();


    public void ajouterDonneur(Donneur d, List<Integer> conditionsIds) {
        List<MedicalCondition> conditions = new ArrayList<>();
        for (Integer id : conditionsIds) {
            MedicalCondition mc = conditionDAO.find(id);
            if (mc != null) conditions.add(mc);
        }
        d.setMedicalConditions(conditions);


        if (!d.isEligible()) {
            d.setStatus(Disponibilite.NON_ELIGIBLE);
        } else {
            d.mettreAJourDisponibilite();
        }

        donneurDAO.save(d);
    }


    public List<Donneur> listerDonneurs() {
        List<Donneur> donneurs = donneurDAO.findAll();

        // لكل donneur نجيب receveurs associés
        for (Donneur d : donneurs) {
            List<Receveur> receveurs = associationDAO.findReceveursByDonneur(d.getId());
            d.setReceveursAssocies(receveurs);
        }

        return donneurs;
    }


    public Donneur trouverById(int id) {
        return donneurDAO.find(id);
    }

    public void supprimer(int id) {

       donneurDAO.delete(id);
    }
    public void update (Donneur d){

        if (d != null) donneurDAO.update(d);
    }


}


