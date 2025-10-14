package com.bloodbank.dao;

import com.bloodbank.model.MedicalCondition;

import javax.persistence.EntityManager;
import java.util.List;

public class MedicalConditionDAO extends  BaseDAO<MedicalCondition> {

    public MedicalConditionDAO() {
        super(MedicalCondition.class);
    }


}
