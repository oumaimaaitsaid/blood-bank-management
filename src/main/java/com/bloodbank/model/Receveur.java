package com.bloodbank.model;

import com.bloodbank.model.enums.EtatReceveur;
import com.bloodbank.model.enums.NiveauBesoin;

import javax.persistence.CascadeType;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

public class Receveur {


    @Enumerated(EnumType.STRING)
    private NiveauBesoin besoin;


    private int pochesRequises;
    private int pochesRecues;


    @Enumerated(EnumType.STRING)
    private EtatReceveur etat;

    @OneToMany(mappedBy = "receveur" ,cascade = CascadeType.ALL)
    private List<DonationAssociation> associations = new ArrayList<>();








}
