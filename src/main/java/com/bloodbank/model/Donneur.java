package com.bloodbank.model;

import com.bloodbank.model.enums.Disponibilite;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

@Entity
public class Donneur extends Personne {

    private double poids;


    @Enumerated(EnumType.STRING)
    private Disponibilite status = Disponibilite.DISPONIBLE;

    private LocalDate dateDernierDon;

    @ManyToMany
    @JoinTable(
            name = "donneur_condition",
            joinColumns = @JoinColumn(name = "donneur_id"),
            inverseJoinColumns = @JoinColumn(name = "condition_id")
    )

    private List<MedicalCondition> medicalConditions;


    //-----Méthodes Utils----


    public boolean isEligible() {
        int age = Period.between(this.getDateNaissance(), LocalDate.now()).getYears();
        if (age < 18 || age > 65 || poids < 50) {
            this.status = Disponibilite.NON_ELIGIBLE;
            return false;
        }
            if (medicalConditions != null) {
                for (MedicalCondition condition : medicalConditions) {
                    String name = condition.getName().toLowerCase();

                    if (name.contains("hépatite") ||
                            name.contains("vih") ||
                            name.contains("diabète") ||
                            name.contains("grossesse") ||
                            name.contains("allaitement")) {
                        this.status = Disponibilite.NON_ELIGIBLE;
                        return false;
                    }
                }





        }
        this.status = Disponibilite.DISPONIBLE;
        return true;
    }


    public void mettreAJourDisponibilite() {
        if (!isEligible()) return;

        if (this.dateDernierDon != null && this.dateDernierDon.plusMonths(1).isAfter(LocalDate.now())) {
            this.status = Disponibilite.NON_DISPONIBLE;
        } else {
            this.status = Disponibilite.DISPONIBLE;
        }
    }


    // ---- Getters & Setters ----
    public double getPoids() {
        return poids;
    }

    public void setPoids(double poids) {
        this.poids = poids;
    }

    public Disponibilite getStatus() {
        return status;
    }

    public void setStatus(Disponibilite status) {
        this.status = status;
    }

    public LocalDate getDateDernierDon() {
        return dateDernierDon;
    }

    public void setDateDernierDon(LocalDate dateDernierDon) {
        this.dateDernierDon = dateDernierDon;
    }

    public List<MedicalCondition> getMedicalConditions() {
        return medicalConditions;
    }

    public void setMedicalConditions(List<MedicalCondition> medicalConditions) {
        this.medicalConditions = medicalConditions;
    }


}
