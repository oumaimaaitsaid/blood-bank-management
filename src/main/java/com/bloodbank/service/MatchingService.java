package com.bloodbank.service;

import com.bloodbank.dao.*;
import com.bloodbank.model.*;
import com.bloodbank.model.enums.*;

import java.time.LocalDate;
import java.util.List;

public class MatchingService {
    private final DonneurDAO donneurDAO =new DonneurDAO();
    private final ReceveurDAO receveurDAO= new ReceveurDAO();
    private final DonationAssociationDAO associationDAO = new DonationAssociationDAO();

    //======= Verifier la compatibilité de sang ============
    public boolean estCompatible(GroupeSanguin donneur, GroupeSanguin receveur) {
    switch (receveur){

        case O_NEG :return donneur == GroupeSanguin.O_NEG;
        case O_POS:return donneur == GroupeSanguin.O_NEG || donneur == GroupeSanguin.O_POS;
        case A_NEG: return donneur == GroupeSanguin.O_NEG || donneur == GroupeSanguin.A_NEG;
        case A_POS: return donneur == GroupeSanguin.O_NEG || donneur == GroupeSanguin.O_POS ||
                donneur == GroupeSanguin.A_NEG || donneur == GroupeSanguin.A_POS;
        case B_NEG: return donneur == GroupeSanguin.O_NEG || donneur == GroupeSanguin.B_NEG;
        case B_POS: return donneur == GroupeSanguin.O_NEG || donneur == GroupeSanguin.O_POS ||
                donneur == GroupeSanguin.B_NEG || donneur == GroupeSanguin.B_POS;
        case AB_NEG: return donneur != GroupeSanguin.AB_POS;
        case AB_POS: return true;
        default : return false;

       }
    }
}