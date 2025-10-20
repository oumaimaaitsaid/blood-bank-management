package com.bloodbank.service;

import com.bloodbank.dao.DonneurDAO;
import com.bloodbank.dao.ReceveurDAO;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.Receveur;
import com.bloodbank.model.enums.Disponibilite;
import com.bloodbank.model.enums.EtatReceveur;
import com.bloodbank.model.enums.NiveauBesoin;

import java.util.List;
import java.util.stream.Collectors;

public class ReceveurService {

    private ReceveurDAO receveurDAO = new ReceveurDAO();
    private DonneurDAO DonneurDAO = new DonneurDAO();
    private  MatchingService service = new MatchingService();

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

    public List<Receveur> listerReceveurs() {
        return receveurDAO.findAll()
                .stream()
                .sorted((r1, r2) -> {
                    // On définit un ordre de priorité
                    int p1 = getPrioriteValue(r1.getBesoin());
                    int p2 = getPrioriteValue(r2.getBesoin());
                    return Integer.compare(p2, p1); // tri décroissant (CRITIQUE avant URGENT avant NORMAL)
                })
                .collect(Collectors.toList());
    }

    //trouver receveur par son ID

    public Receveur trouverById(int id){
        return receveurDAO.find(id);
    }

    // supprimer Receveur

    public void supprimer(int id){

        receveurDAO.delete(id);
    }

    public List<Donneur> getCompatibleDonneurs(int receveurId){
        Receveur r =receveurDAO.find(receveurId);
        return DonneurDAO.findAll().stream()
                .filter(d->d.getStatus() == Disponibilite.DISPONIBLE &&
                        service.estCompatible(d.getGroupe() , r.getGroupe()))
                .collect(Collectors.toList());
    }

    private int getPrioriteValue(NiveauBesoin besoin) {
        switch (besoin) {
            case CRITIQUE:
                return 3;
            case URGENT:
                return 2;
            case NORMAL:
            default:
                return 1;
        }
    }


}