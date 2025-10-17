package com.bloodbank.test;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.enums.Disponibilite;
import org.junit.Test;

import java.time.LocalDate;
import java.util.ArrayList;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


public class DonneurTest {


    @Test
    public void testDonneurEligible() {
        Donneur donneur = new Donneur();
        donneur.setDateNaissance(LocalDate.now().minusYears(30));
        donneur.setPoids(70);
        donneur.setMedicalConditions(new ArrayList<>()); // aucune maladie

        boolean result = donneur.isEligible();

        assertTrue("Le donneur devrait être éligible", result);
        assertEquals(Disponibilite.DISPONIBLE, donneur.getStatus());
    }


}
