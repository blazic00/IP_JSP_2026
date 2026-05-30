package model;

import java.time.LocalDate;

public class WorkLog {
	private Long id;
	private String description;
	private String title;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public LocalDate getWeek() {
		return week;
	}
	public void setWeek(LocalDate week) {
		this.week = week;
	}
	private LocalDate week;
}
