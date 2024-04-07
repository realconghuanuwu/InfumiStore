package dao;

import java.util.List;

import entity.GioHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class GioHangDAO extends AbstractDAO<GioHang, Integer>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public GioHang insert(GioHang entity) {
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
	public GioHang update(GioHang entity) {
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
	public GioHang delete(Integer key) {
		GioHang entity = selectByID(key);
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
	public List<GioHang> selectAll() {
		String jpql = "SELECT e FROM GioHang e";
		TypedQuery<GioHang> query = em.createQuery(jpql,GioHang.class);
		return query.getResultList();
	}

	@Override
	public GioHang selectByID(Integer key) {
		GioHang entity = em.find(GioHang.class, key);
		return entity;
	}
	
	public GioHang selectGioHangByMaKhachHang(Long makh) {
		String jpql = "SELECT e FROM GioHang e where e.khachHang.id = :makh";
		TypedQuery<GioHang> query = em.createQuery(jpql,GioHang.class);
		query.setParameter("makh", makh);
		return query.getSingleResult();
	}
	
	
}
