package it.dping.cloudvendingmachines.service;

import java.util.List;

public interface CrudService<T extends Object>
{

    T save(T entity) throws Exception;

    T update(T entity);

    void delete(T entity);

    boolean deleteById(Long id);

    void deleteInBatch(List<T> entities);

    T findById(Long id);

    List<T> findAll();
}
