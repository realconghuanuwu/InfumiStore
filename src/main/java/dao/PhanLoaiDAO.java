package dao;

import java.util.List;

import entity.PhanLoai;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class PhanLoaiDAO extends AbstractDAO<PhanLoai, String>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public PhanLoai insert(PhanLoai entity) {
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
	public PhanLoai update(PhanLoai entity) {
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
	public PhanLoai delete(String key) {
		PhanLoai entity = selectByID(key);
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
	public List<PhanLoai> selectAll() {
		String jpql = "SELECT e FROM PhanLoai e";
		TypedQuery<PhanLoai> query = em.createQuery(jpql,PhanLoai.class);
		return query.getResultList();
	}

	@Override
	public PhanLoai selectByID(String key) {
		PhanLoai entity = em.find(PhanLoai.class, key);
		return entity;
	}
	
}
