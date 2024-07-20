package com.web.mvc.persistence;

import java.util.List;
import java.util.Optional;

public interface CrudRepository<T, ID> {
    T save(T entity);
    Optional<T> findById(ID id);
    List<T> findAll();
    List<T> findAllName(String nombre);
    void deleteById(ID id);
}
