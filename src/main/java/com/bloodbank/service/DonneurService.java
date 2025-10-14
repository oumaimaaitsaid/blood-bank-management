package com.bloodbank.service;


import com.bloodbank.dao.DonneurDAO;
import com.bloodbank.dao.MedicalConditionDAO;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.MedicalCondition;
import com.bloodbank.model.enums.Disponibilite;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class DonneurService {
    private DonneurDAO donneurDAO = new DonneurDAO();
    private MedicalConditionDAO conditionDAO = new MedicalConditionDAO();

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


