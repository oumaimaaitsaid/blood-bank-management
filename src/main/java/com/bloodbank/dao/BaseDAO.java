package com.bloodbank.dao;

import com.bloodbank.util.JpaUtil;

import javax.persistence.*;
import java.util.List;

public abstract class BaseDAO<T> {
    private final Class<T> entityClass;

    public BaseDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }


    public void save (T entity){
        EntityManager em =JpaUtil.getEntityManager();

        EntityTransaction tr = em.getTransaction();
        try{
            tr.begin();
            em.persist(entity);
            tr.commit();
        }
        catch(Exception e){
            if(tr.isActive() ) tr.rollback();
            e.printStackTrace();
        }finally {
            em.close();
        }
    }



    public T find(int id) {
        EntityManager em =JpaUtil.getEntityManager();
        try{
            return em.find(entityClass, id);
        } finally {
            em.close();
        }
    }



}