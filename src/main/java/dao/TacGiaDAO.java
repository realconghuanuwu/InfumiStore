package dao;
import java.util.List;

import entity.TacGia;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class TacGiaDAO extends AbstractDAO<TacGia, Integer> {
    private EntityManager em = JpaUtils.getEntityManager();

    @Override
    protected void finalize() throws Throwable {
        em.close();
    }

    @Override
    public TacGia insert(TacGia entity) {
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return entity;
    }

    @Override
    public TacGia update(TacGia entity) {
        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return entity;
    }

    @Override
    public TacGia delete(Integer key) {
        TacGia entity = selectByID(key);
        try {
            em.getTransaction().begin();
            em.remove(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return entity;
    }

    @Override
    public List<TacGia> selectAll() {
        String jpql = "SELECT e FROM TacGia e";
        TypedQuery<TacGia> query = em.createQuery(jpql, TacGia.class);
        return query.getResultList();
    }

    @Override
    public TacGia selectByID(Integer key) {
        TacGia entity = em.find(TacGia.class, key);
        return entity;
    }
}
