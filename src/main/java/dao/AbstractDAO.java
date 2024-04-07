package dao;

import java.util.List;



public abstract class AbstractDAO<E, K> {
    abstract public E insert(E entity);
    abstract public E update(E entity);
    abstract public E delete(K key);
    abstract public List<E> selectAll();
    abstract public E selectByID(K key);  
}