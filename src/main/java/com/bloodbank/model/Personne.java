package com.bloodbank.model;

import com.bloodbank.model.enums.GroupeSanguin;
import com.bloodbank.model.enums.Sexe;

import javax.persistence.*;
import java.time.LocalDate;

@MappedSuperclass
public class Personne {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id;


    private String prenom;
    private String nom;
    private String telephone;
    private String cin;


    @Enumerated(EnumType.STRING)
    private Sexe sexe;



    private LocalDate dateNaissance;


    @Enumerated(EnumType.STRING)
    private GroupeSanguin groupe;

    private LocalDate createdAt =LocalDate.now();


    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }

    public String getCin() { return cin; }
    public void setCin(String cin) { this.cin = cin; }

    public Sexe getSexe() { return sexe; }
    public void setSexe(Sexe sexe) { this.sexe = sexe; }

    public LocalDate getDateNaissance() { return dateNaissance; }
    public void setDateNaissance(LocalDate dateNaissance) { this.dateNaissance = dateNaissance; }

    public GroupeSanguin getGroupe() { return groupe; }
    public void setGroupe(GroupeSanguin groupe) { this.groupe = groupe; }

    public LocalDate getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDate createdAt) { this.createdAt = createdAt; }




}
