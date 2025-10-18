package com.bloodbank.model;

import com.bloodbank.model.enums.EtatReceveur;
import com.bloodbank.model.enums.GroupeSanguin;
import com.bloodbank.model.enums.NiveauBesoin;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Receveur extends  Personne {


    @Enumerated(EnumType.STRING)
    private NiveauBesoin besoin;


    private int pochesRequises;
    private int pochesRecues;


    @Enumerated(EnumType.STRING)
    private EtatReceveur etat;

    @OneToMany(mappedBy = "receveur" ,cascade = CascadeType.ALL)
    private List<DonationAssociation> associations = new ArrayList<>();


    // ----Méthodes Util ----


    public boolean isSatisfait()
    {
        return pochesRecues >= pochesRequises;
    }

    public void ajouterPoche(){

        this.pochesRecues++;
         this.pochesRequises--;
        if(isSatisfait()) this.etat=EtatReceveur.SATISFAIT;
    }


    // ---- Getters & Setters ----
    public NiveauBesoin getBesoin() { return besoin; }
    public void setBesoin(NiveauBesoin besoin) { this.besoin = besoin; }

    public int getPochesRequises() { return pochesRequises; }
    public void setPochesRequises(int pochesRequises) { this.pochesRequises = pochesRequises; }

    public int getPochesRecues() { return pochesRecues; }
    public void setPochesRecues(int pochesRecues) { this.pochesRecues = pochesRecues; }

    public EtatReceveur getEtat() { return etat; }
    public void setEtat(EtatReceveur etat) { this.etat = etat; }

    public List<DonationAssociation> getAssociations() { return associations; }
    public void setAssociations(List<DonationAssociation> associations) { this.associations = associations; }



}
