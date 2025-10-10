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



