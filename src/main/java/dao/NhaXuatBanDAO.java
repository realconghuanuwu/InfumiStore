package dao;

import java.util.List;

import entity.NhaXuatBan;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class NhaXuatBanDAO extends AbstractDAO<NhaXuatBan, String> {
    private EntityManager em = JpaUtils.getEntityManager();

    @Override
    protected void finalize() throws Throwable {
        em.close();
    }

    @Override
    public NhaXuatBan insert(NhaXuatBan entity) {
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
    public NhaXuatBan update(NhaXuatBan entity) {
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
    public NhaXuatBan delete(String key) {
        NhaXuatBan entity = selectByID(key);
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
    public List<NhaXuatBan> selectAll() {
        String jpql = "SELECT e FROM NhaXuatBan e";
        TypedQuery<NhaXuatBan> query = em.createQuery(jpql, NhaXuatBan.class);
        return query.getResultList();
    }

    @Override
    public NhaXuatBan selectByID(String key) {
        NhaXuatBan entity = em.find(NhaXuatBan.class, key);
        return entity;
    }
}
