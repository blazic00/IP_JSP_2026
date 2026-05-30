package model.entity;

public class InternshipApplication {

	private int id;
	private String studentCV;
	private String status;
	private String studentName;
	private String internshipDescription;
	private int studentId;
	private int studentInternshipId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getStudentCV() {
	    return studentCV;
	}

	public void setStudentCV(String studentCV) {
	    this.studentCV = studentCV;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getInternshipDescription() {
		return internshipDescription;
	}
	public void setInternshipDescription(String internshipDescription) {
		this.internshipDescription = internshipDescription;
	}
	public int getStudentInternshipId() {
		return studentInternshipId;
	}
	public void setStudentInternshipId(int studentInternshipId) {
		this.studentInternshipId = studentInternshipId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	

	
	
	
}
