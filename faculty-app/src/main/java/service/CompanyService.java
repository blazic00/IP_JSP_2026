package service;

import java.util.List;

import model.entity.Company;
import repository.CompanyRepository;

public class CompanyService {
	

	private CompanyRepository companyRepository = new CompanyRepository();
	
	
	public void update(Company company) {
		companyRepository.updateUser(company);
	}

	
	public List<Company> getAll(){
		return companyRepository.findAll();
	}
	
	public Company getById(Long id) {
		return companyRepository.findById(id);
	}
	
	public void changePassword(Company company, String newPassword) {
		company.setPassword(newPassword);
		companyRepository.updateUser(company);
	}


	public void changeStatus(int id) {
		// TODO Auto-generated method stub
		var company = companyRepository.findById(Long.valueOf(id));
		if(company.isActive()) {
			company.setActive(false);
		}
		else {
			company.setActive(true);
		}
		companyRepository.updateUser(company);
	}




}
