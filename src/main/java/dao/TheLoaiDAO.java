package dao;

import java.util.List;

import entity.TheLoai;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class TheLoaiDAO extends AbstractDAO<TheLoai, String> {
    private EntityManager em = JpaUtils.getEntityManager();

    @Override
    protected void finalize() throws Throwable {
        em.close();
    }

    @Override
    public TheLoai insert(TheLoai entity) {
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
    public TheLoai update(TheLoai entity) {
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
    public TheLoai delete(String key) {
        TheLoai entity = selectByID(key);
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
    public List<TheLoai> selectAll() {
        String jpql = "SELECT e FROM TheLoai e";
        TypedQuery<TheLoai> query = em.createQuery(jpql, TheLoai.class);
        return query.getResultList();
    }

    @Override
    public TheLoai selectByID(String key) {
        TheLoai entity = em.find(TheLoai.class, key);
        return entity;
    }
}
