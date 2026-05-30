package service;

import repository.InternshipRepository;

import java.util.List;

import model.entity.*;

public class InternshipService {

	private InternshipRepository internshipRepository = new InternshipRepository();
	
	public List<Internship> getAll()
	{
		return internshipRepository.findAll();
	}

	public void addInternship(Internship internship) {
		internshipRepository.add(internship);
	}

	public Internship getById(long id) {
		return internshipRepository.findById(id);
	}

	public void deleteById(Long internshipId) {
		internshipRepository.delete(internshipId);
	}

	public  List<Internship> getAllForCompany(User user) {
		return internshipRepository.findAllByCompanyId(user.getId());
	}

	public void updateInternship(Internship internship) {
		internshipRepository.updateInternship(internship);
		
	}
}
