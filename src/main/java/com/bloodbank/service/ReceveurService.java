package com.bloodbank.service;

import com.bloodbank.dao.ReceveurDAO;
import com.bloodbank.model.Receveur;
import com.bloodbank.model.enums.EtatReceveur;
import com.bloodbank.model.enums.NiveauBesoin;

import java.util.List;

public class ReceveurService {

    private ReceveurDAO receveurDAO = new ReceveurDAO();

    //ajouter Receveur

    public void ajouterReceveur(Receveur r){
        switch(r.getBesoin()){
            case CRITIQUE:
                r.setPochesRequises(4);
                break;
            case URGENT:
                r.setPochesRequises(3);
                break;
            default:
                r.setPochesRequises(1);
                break;
        }
        r.setEtat(EtatReceveur.EN_ATTENTE);
        receveurDAO.save(r);
    }

    //liste de tous les receveurs

    public List<Receveur> listerReceveurs(){
        return receveurDAO.findAll();
    }

    //trouver receveur par son ID

    public Receveur trouverById(int id){
        return receveurDAO.find(id);
    }

    // supprimer Receveur

    public void supprimer(int id){
        Receveur r =receveurDAO.find(id);
        if(r!=null) receveurDAO.delete(r);
    }
}