package model;

import java.util.List;

public class InternshipStudentEvaluation {

	private int id;
	private List<WorkLog> workLogList;
	private String companyEvaluation;
	public List<WorkLog> getWorkLogList() {
		return workLogList;
	}
	private Integer grade;
	public void setWorkLogList(List<WorkLog> worklogs) {
		this.workLogList = worklogs;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompanyEvaluation() {
		return companyEvaluation;
	}
	public void setCompanyEvaluation(String companyEvaluation) {
		this.companyEvaluation = companyEvaluation;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	
}
