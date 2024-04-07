package dao;

import java.util.List;

import entity.GioHang;
import entity.HoaDon;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class HoaDonDAO extends AbstractDAO<HoaDon, Integer>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public HoaDon insert(HoaDon entity) {
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
	public HoaDon update(HoaDon entity) {
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
	public HoaDon delete(Integer key) {
		HoaDon entity = selectByID(key);
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
	public List<HoaDon> selectAll() {
		String jpql = "SELECT e FROM HoaDon e";
		TypedQuery<HoaDon> query = em.createQuery(jpql,HoaDon.class);
		return query.getResultList();
	}

	@Override
	public HoaDon selectByID(Integer key) {
		HoaDon entity = em.find(HoaDon.class, key);
		return entity;
	}
	
	public List<HoaDon> selectGioHangByMaKhachHang(Long makh) {
		String jpql = "SELECT e FROM HoaDon e where e.khachHang.id = :makh";
		TypedQuery<HoaDon> query = em.createQuery(jpql,HoaDon.class);
		query.setParameter("makh", makh);
		return query.getResultList();
	}
	
}
