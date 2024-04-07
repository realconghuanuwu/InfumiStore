package dao;

import java.util.List;

import entity.GioHang;
import entity.NhanVien;
import entity.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import util.JpaUtils;

public class SanPhamDAO extends AbstractDAO<SanPham, Integer> {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public SanPham insert(SanPham entity) {
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
	public SanPham update(SanPham entity) {
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
	public SanPham delete(Integer key) {
		SanPham entity = selectByID(key);
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
	public List<SanPham> selectAll() {
		String jpql = "SELECT e FROM SanPham e";
		TypedQuery<SanPham> query = em.createQuery(jpql,SanPham.class);
		return query.getResultList();
	}
	
	public List<SanPham> selectSanPhamByPhanLoai(String maPhanLoai) {
		String jpql = "SELECT e FROM SanPham e where e.phanLoai.id = :id";
		TypedQuery<SanPham> query = em.createQuery(jpql,SanPham.class);
		query.setParameter("id", maPhanLoai);
		return query.getResultList();
	}

	@Override
	public SanPham selectByID(Integer key) {
		SanPham entity = em.find(SanPham.class, key);
		return entity;
	}
	
	public List<SanPham> selectSanPhamByMaGioHang(Integer key) {
		String jpql = "SELECT sp FROM ChiTietGioHang ctgh JOIN ctgh.sanPham sp WHERE ctgh.gioHang.id = :id";
		TypedQuery<SanPham> query = em.createQuery(jpql,SanPham.class);
		query.setParameter("id", key);
		return query.getResultList();
	}

	

}
