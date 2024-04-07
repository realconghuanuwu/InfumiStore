package util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtils {
	private static EntityManagerFactory entityManagerFactory;

	static public EntityManager getEntityManager() {
		if (entityManagerFactory == null || !entityManagerFactory.isOpen()) {
			entityManagerFactory = Persistence.createEntityManagerFactory("InfumiStore");
		}
		return entityManagerFactory.createEntityManager();
	}
	
	static public void shutdown() {
		if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
			entityManagerFactory.close();
		}
		entityManagerFactory = null;
	}
}
