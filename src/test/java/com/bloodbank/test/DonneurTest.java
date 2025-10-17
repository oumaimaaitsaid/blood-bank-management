package com.bloodbank.test;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.MedicalCondition;
import com.bloodbank.model.enums.Disponibilite;
import org.junit.Test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;

import static org.junit.Assert.*;


public class DonneurTest {


    @Test
    public void testDonneurEligible() {
        Donneur donneur = new Donneur();
        donneur.setDateNaissance(LocalDate.now().minusYears(30));
        donneur.setPoids(70);
        donneur.setMedicalConditions(new ArrayList<>());

        boolean result = donneur.isEligible();

        assertTrue("Le donneur devrait être éligible", result);
        assertEquals(Disponibilite.DISPONIBLE, donneur.getStatus());
    }


    @Test
    public void testDonneurNonEligibleParAge() {
        Donneur donneur = new Donneur();
        donneur.setDateNaissance(LocalDate.now().minusYears(17));
        donneur.setPoids(70);
        donneur.setMedicalConditions(new ArrayList<>());
        boolean result = donneur.isEligible();

        assertFalse("le donneur est jeune" , result);
        assertEquals(Disponibilite.NON_ELIGIBLE, donneur.getStatus());
    }

    @Test
    public void testDonneurNonEligibleParMaladie() {
        Donneur donneur = new Donneur();
        donneur.setDateNaissance(LocalDate.now().minusYears(25));
        donneur.setPoids(70);

        MedicalCondition vih =new MedicalCondition();
        vih.setName("VIH");
        donneur.setMedicalConditions(Arrays.asList(vih));

        boolean result = donneur.isEligible();
        assertFalse("Le donneur est porteur du VIH" ,result);
        assertEquals(Disponibilite.NON_ELIGIBLE, donneur.getStatus());
    }

}
