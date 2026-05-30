package service;

import java.util.List;

import model.entity.Internship;
import repository.InternshipRepository;

public class InternshipService {
private InternshipRepository internshipRepository = new InternshipRepository();
	
	public List<Internship> getAll()
	{
		return internshipRepository.findAll();
	}

}
