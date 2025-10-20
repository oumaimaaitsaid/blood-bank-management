package com.bloodbank.dao;

import com.bloodbank.model.DonationAssociation;
import com.bloodbank.model.Receveur;
import com.bloodbank.util.JpaUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class DonationAssociationDAO extends BaseDAO<DonationAssociation>{

    public DonationAssociationDAO() {
        super(DonationAssociation.class);
    }
    public List<Receveur> findReceveursByDonneur(int donneurId) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT a.receveur FROM DonationAssociation a WHERE a.donneur.id = :id",
                            Receveur.class
                    ).setParameter("id", donneurId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

}