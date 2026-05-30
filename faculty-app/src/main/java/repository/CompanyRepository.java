package repository;

import java.util.List;


import jakarta.persistence.NoResultException;
import model.entity.Company;
import model.entity.User;

public class CompanyRepository extends MyBaseRepo {
	
	 public Company findByUsernameAndPassword(String username, String password) {
		 return executeTransaction(em->{
			 String query = "SELECT u FROM Company u WHERE u.username = :username AND u.password = :password";
		       return em.createQuery(query, Company.class)
		                   .setParameter("username", username)
		                   .setParameter("password", password)
		                   .getSingleResult();
		 });
	 }
	 
	 
	
	 public Company findById(Long id) {
		 return executeTransaction(em->{
			return em.find(Company.class, id);
		 });
	 }
		
	 	public List<Company> findAll() {
		 	return executeTransaction(em->{
		 		return em.createQuery("SELECT u FROM Company u", Company.class)
		 				.getResultList();
		 	});
		}

		public void updateUser(Company user) {
			executeTransaction(em->{
				em.merge(user);
				return user;
			});
		}

    
}