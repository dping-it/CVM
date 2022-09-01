package it.dping.cloudvendingmachines.converter;

public interface JSONConvert<T extends Object> {
    T fromJSON(String json);
    String toJSON(T entity);
}
