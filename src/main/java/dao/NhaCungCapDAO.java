package dao;

import java.util.List;

import entity.NhaCungCap;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class NhaCungCapDAO extends AbstractDAO<NhaCungCap, String> {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public NhaCungCap insert(NhaCungCap entity) {
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
	public NhaCungCap update(NhaCungCap entity) {
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
	public NhaCungCap delete(String key) {
		NhaCungCap entity = selectByID(key);
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
	public List<NhaCungCap> selectAll() {
		String jpql = "SELECT e FROM NhaCungCap e";
		TypedQuery<NhaCungCap> query = em.createQuery(jpql, NhaCungCap.class);
		return query.getResultList();
	}

	@Override
	public NhaCungCap selectByID(String key) {
		NhaCungCap entity = em.find(NhaCungCap.class, key);
		return entity;
	}

}
