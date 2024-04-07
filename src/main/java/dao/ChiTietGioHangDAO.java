package dao;

import java.util.List;

import entity.ChiTietGioHang;
import entity.GioHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class ChiTietGioHangDAO{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	public ChiTietGioHang insert(ChiTietGioHang entity) {
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

	public ChiTietGioHang update(ChiTietGioHang entity) {
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

	public ChiTietGioHang delete(Long magh, Long masp) {
		String DELETE_JPQL = "DELETE FROM ChiTietGioHang c WHERE c.gioHang.id = :maGioHang AND c.sanPham.id = :maSanPham";
	    ChiTietGioHang entity = null;
	    try {
	        em.getTransaction().begin();
	        Query query = em.createQuery(DELETE_JPQL);
	        query.setParameter("maGioHang", magh);
	        query.setParameter("maSanPham", masp);
	        query.executeUpdate();
	        em.getTransaction().commit();
	    } catch (Exception e) {
	        em.getTransaction().rollback();
	        e.printStackTrace();
	    }
	    return entity;
	}

	public List<ChiTietGioHang> selectAll() {
		String jpql = "SELECT e FROM ChiTietGioHang e";
		TypedQuery<ChiTietGioHang> query = em.createQuery(jpql,ChiTietGioHang.class);
		return query.getResultList();
	}

	public ChiTietGioHang selectByID(Integer key) {
		ChiTietGioHang entity = em.find(ChiTietGioHang.class, key);
		return entity;
	}
	
	
	public List<ChiTietGioHang> selectChiTietGioHangByMaGioHang(Long magh) {
//		List<ChiTietGioHang> list = gh.getChiTietGioHangs();
		
	    String jpql = "SELECT ctgh FROM ChiTietGioHang ctgh WHERE ctgh.gioHang.id = :magh";
	    TypedQuery<ChiTietGioHang> query = em.createQuery(jpql, ChiTietGioHang.class);
	    query.setParameter("magh", magh);
	    return query.getResultList();
	}


	
}
