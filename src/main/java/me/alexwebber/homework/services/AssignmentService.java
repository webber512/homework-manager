package me.alexwebber.homework.services;

import java.util.List;

import org.springframework.ui.Model;

import me.alexwebber.homework.model.Assignment;

public interface AssignmentService {

	public List<Assignment> getAllAssignments();

	public List<Assignment> getCompletedAssignments();

	public List<Assignment> getOpenAssignments();

	public List<Assignment> getAssignmentsForClass(Integer id);

	public Assignment getAssignmentById(Integer id);

	public Integer getNumberOfAssignments();
	
	public Integer getNumberOfOpenAssignments();

	public Integer getNumberOfAssignmentsForClass(Integer id);

	public void addAssignment(Model model, Assignment assignment);

	public void deleteAssignment(Integer id);

	public void markAssignmentCompleted(Integer id);

	public void markAssignmentIncomplete(Integer id);

	public Integer getNumberOfCompletedAssignments();
}
