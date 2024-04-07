package dao;

import java.util.List;

import entity.AnhSanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class AnhSanPhamDAO extends AbstractDAO<AnhSanPham, Integer> {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public AnhSanPham insert(AnhSanPham entity) {
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
	public AnhSanPham update(AnhSanPham entity) {
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
	public AnhSanPham delete(Integer key) {
		AnhSanPham entity = selectByID(key);
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
	public List<AnhSanPham> selectAll() {
		String jpql = "SELECT e FROM AnhSanPham e";
		TypedQuery<AnhSanPham> query = em.createQuery(jpql, AnhSanPham.class);
		return query.getResultList();
	}

	@Override
	public AnhSanPham selectByID(Integer key) {
		AnhSanPham entity = em.find(AnhSanPham.class, key);
		return entity;
	}
	
	public List<AnhSanPham> selectAnhSanPhamsBySanPhamID(int id) {
		String jpql = "SELECT e FROM AnhSanPham e where e.sanPham.id = :id";
		TypedQuery<AnhSanPham> query = em.createQuery(jpql, AnhSanPham.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

}
