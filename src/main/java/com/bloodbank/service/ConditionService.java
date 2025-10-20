package com.bloodbank.service;

import com.bloodbank.dao.MedicalConditionDAO;
import com.bloodbank.model.MedicalCondition;

import java.util.List;

public class ConditionService {
    private final MedicalConditionDAO conditionDAO = new MedicalConditionDAO();

    public List<MedicalCondition> listerConditions() {
        return conditionDAO.findAll();
    }
}

