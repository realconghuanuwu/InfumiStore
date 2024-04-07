package dao;

import java.util.List;

import entity.KhachHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class KhachHangDAO extends AbstractDAO<KhachHang, Integer>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public KhachHang insert(KhachHang entity) {
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
	public KhachHang update(KhachHang entity) {
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
	public KhachHang delete(Integer key) {
		KhachHang entity = selectByID(key);
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
	public List<KhachHang> selectAll() {
		String jpql = "SELECT e FROM KhachHang e";
		TypedQuery<KhachHang> query = em.createQuery(jpql,KhachHang.class);
		return query.getResultList();
	}

	@Override
	public KhachHang selectByID(Integer key) {
		KhachHang entity = em.find(KhachHang.class, key);
		return entity;
	}
	
	public KhachHang selectByEmail(String email) {
		String jpql = "SELECT e FROM KhachHang e where e.email = :email";
		TypedQuery<KhachHang> query = em.createQuery(jpql,KhachHang.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}
	
}
