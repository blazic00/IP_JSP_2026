package repository;

import java.util.List;


import jakarta.persistence.NoResultException;
import model.entity.Internship;

public class InternshipRepository extends MyBaseRepo {
	
	 
	 public Internship findById(Long id) {
		 return executeTransaction(em->{
			return em.find(Internship.class, id);
		 });
	 }
		
	 	public List<Internship> findAll() {
		 	return executeTransaction(em->{
		 		return em.createQuery("SELECT u FROM Internship u", Internship.class)
		 				.getResultList();
		 	});
		}

		public void updateInternship(Internship internship) {
			executeTransaction(em->{
				em.merge(internship);
				return internship;
			});
		}

		public void add(Internship internship) {
			executeTransaction(em->{
				em.persist(internship);
				return  internship;
			});
		}

		public void delete(Long  id) {
			executeTransaction(em->{
				Internship i = em.find(Internship.class, id);
				em.remove(i);
				return i;
			});
		}

		public List<Internship> findAllByCompanyId(Long id) {
			return executeTransaction(em->{
		 		return em.createQuery("SELECT u FROM Internship u where u.company.id = :id", Internship.class)
		 				.setParameter("id", id)
		 				.getResultList();
		 	});
		}

    
}