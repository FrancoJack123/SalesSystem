package com.web.mvc.persistence;

import com.web.mvc.connection.EntityPersistence;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

public class GenericRepository<T, ID> implements CrudRepository<T, ID>{
    private final Class<T> entityClass;

    public GenericRepository(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    @Override
    public T save(T entity) {
        EntityManager entityManager = EntityPersistence.geEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.merge(entity);
        transaction.commit();
        entityManager.close();
        return entity;
    }

    @Override
    public Optional<T> findById(ID id) {
        EntityManager entityManager = EntityPersistence.geEntityManager();
        T entity = entityManager.find(getEntityClass(), id);
        entityManager.close();
        if (entity != null){
            return Optional.of(entity);
        }
        return Optional.empty();
    }

    @Override
    public List<T> findAll() {
        EntityManager entityManager = EntityPersistence.geEntityManager();
        String jpql = "SELECT x FROM ".concat(getEntityClass().getName()).concat(" x");
        TypedQuery<T> query = entityManager.createQuery(jpql, getEntityClass());
        List<T> resultList = query.getResultList();
        entityManager.close();
        return resultList;
    }

    @Override
    public List<T> findAllName(String nombre) {
        EntityManager entityManager = EntityPersistence.geEntityManager();
        String jpql = "SELECT x FROM ".concat(getEntityClass().getName())
                .concat(" x WHERE :nombre IS NULL OR :nombre = '' OR LOWER(x.nombre) LIKE LOWER(CONCAT('%', :nombre, '%'))");
        TypedQuery<T> query = entityManager.createQuery(jpql, getEntityClass());
        query.setParameter("nombre", nombre);
        List<T> resultList = query.getResultList();
        entityManager.close();
        return resultList;
    }

    @Override
    public void deleteById(ID id) {
        EntityManager entityManager = EntityPersistence.geEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        T entity = entityManager.find(getEntityClass(), id);
        if (entity != null) {
            entityManager.remove(entity);
        }
        transaction.commit();
        entityManager.close();
    }

    private Class<T> getEntityClass() {
        return entityClass;
    }
}
