package repository;

import java.util.List;


import jakarta.persistence.NoResultException;
import model.entity.User;

public class UserRepository extends MyBaseRepo {
	
	 public User findByUsernameAndPassword(String username, String password) {
		 return executeTransaction(em->{
			 String query = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		       return em.createQuery(query, User.class)
		                   .setParameter("username", username)
		                   .setParameter("password", password)
		                   .getSingleResult();
		 });
	 }
	 
	 
	
	 public User findById(Long id) {
		 return executeTransaction(em->{
			return em.find(User.class, id);
		 });
	 }
		
	 	public List<User> findAll() {
		 	return executeTransaction(em->{
		 		return em.createQuery("SELECT u FROM User u", User.class)
		 				.getResultList();
		 	});
		}

		public void updateUser(User user) {
			executeTransaction(em->{
				em.merge(user);
				return user;
			});
		}

    
}