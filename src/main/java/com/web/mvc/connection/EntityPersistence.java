package com.web.mvc.connection;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityPersistence {
    private static final EntityManagerFactory ENTITY_MANAGER_FACTORY = buildEntityManagerFactory();
    private static EntityManagerFactory buildEntityManagerFactory(){
        return Persistence.createEntityManagerFactory("dbAdmin");
    }
    public static EntityManager geEntityManager(){
        return ENTITY_MANAGER_FACTORY.createEntityManager();
    }
}
