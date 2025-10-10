package com.bloodbank.model;

import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.*;
import java.time.LocalDate;

public class DonationAssociation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name ="donneur_id")
    private  Donneur donneur;

    @ManyToOne
    @JoinColumn(name ="receveur_id")
    private Receveur receveur;


    private LocalDate dateAssociation;

    @Column(nullable =false)
    private String statut ="CONFIRMÉ";


    // ---- Getters & Setters ----
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Donneur getDonneur() { return donneur; }
    public void setDonneur(Donneur donneur) { this.donneur = donneur; }

    public Receveur getReceveur() { return receveur; }
    public void setReceveur(Receveur receveur) { this.receveur = receveur; }

    public LocalDate getDateAssociation() { return dateAssociation; }
    public void setDateAssociation(LocalDate dateAssociation) { this.dateAssociation = dateAssociation; }

    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }
}
