package dao;

import java.util.List;

import entity.NhanVien;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class NhanVienDAO extends AbstractDAO<NhanVien, String>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public NhanVien insert(NhanVien entity) {
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
	public NhanVien update(NhanVien entity) {
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
	public NhanVien delete(String key) {
		NhanVien entity = selectByID(key);
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
	public List<NhanVien> selectAll() {
		String jpql = "SELECT e FROM NhanVien e";
		TypedQuery<NhanVien> query = em.createQuery(jpql,NhanVien.class);
		return query.getResultList();
	}

	@Override
	public NhanVien selectByID(String key) {
		NhanVien entity = em.find(NhanVien.class, key);
		return entity;
	}
	
}
