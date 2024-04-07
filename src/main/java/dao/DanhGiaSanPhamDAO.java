package dao;

import java.util.List;

import entity.DanhGiaSanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class DanhGiaSanPhamDAO extends AbstractDAO<DanhGiaSanPham, Integer>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public DanhGiaSanPham insert(DanhGiaSanPham entity) {
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
	public DanhGiaSanPham update(DanhGiaSanPham entity) {
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
	public DanhGiaSanPham delete(Integer key) {
		DanhGiaSanPham entity = selectByID(key);
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
	public List<DanhGiaSanPham> selectAll() {
		String jpql = "SELECT e FROM DanhGiaSanPham e";
		TypedQuery<DanhGiaSanPham> query = em.createQuery(jpql,DanhGiaSanPham.class);
		return query.getResultList();
	}

	@Override
	public DanhGiaSanPham selectByID(Integer key) {
		DanhGiaSanPham entity = em.find(DanhGiaSanPham.class, key);
		return entity;
	}
	
}
