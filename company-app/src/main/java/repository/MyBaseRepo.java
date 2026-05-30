package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;


abstract class MyBaseRepo {
	 private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");

	    public static EntityManager getEntityManager() {
	        return emf.createEntityManager();
	    }

	    protected <T> T executeTransaction(TransactionCallback<T> callback) {
	        EntityManager em = getEntityManager();
	        em.getTransaction().begin();
	        try {
	            T result = callback.execute(em);
	            em.getTransaction().commit();
	            return result;
	        } catch (Exception e) {
	            em.getTransaction().rollback();
	            throw e;  // Rethrow or handle exception as needed
	        } finally {
	            em.close();
	        }
	    }
	 // Callback interface for transaction handling
	    @FunctionalInterface
	    interface TransactionCallback<T> {
	        T execute(EntityManager em);
	    }
}
