package dao;

import java.util.List;

import entity.ChiTietHoaDon;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class ChiTietHoaDonDAO{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	public ChiTietHoaDon insert(ChiTietHoaDon entity) {
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

	public ChiTietHoaDon update(ChiTietHoaDon entity) {
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

	public ChiTietHoaDon delete(Integer mahd, Integer masp) {
		String DELETE_JPQL = "DELETE FROM ChiTietHoaDon c WHERE c.maHoaDon = :maHoaDon AND c.maSanPham = :maSanPham";
	    ChiTietHoaDon entity = null;
	    try {
	        em.getTransaction().begin();
	        Query query = em.createQuery(DELETE_JPQL);
	        query.setParameter("maHoaDon", mahd);
	        query.setParameter("maSanPham", masp);
	        query.executeUpdate();
	        em.getTransaction().commit();
	    } catch (Exception e) {
	        em.getTransaction().rollback();
	        e.printStackTrace();
	    }
	    return entity;
	}

	public List<ChiTietHoaDon> selectAll() {
		String jpql = "SELECT e FROM ChiTietHoaDon e";
		TypedQuery<ChiTietHoaDon> query = em.createQuery(jpql,ChiTietHoaDon.class);
		return query.getResultList();
	}

	public ChiTietHoaDon selectByID(Integer key) {
		ChiTietHoaDon entity = em.find(ChiTietHoaDon.class, key);
		return entity;
	}
	
}
