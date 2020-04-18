package me.alexwebber.homework.services;

import java.util.List;

import org.springframework.ui.Model;

import me.alexwebber.homework.model.Assignment;

public interface AssignmentService {

	public List<Assignment> getAllAssignments();

	public List<Assignment> getAssignmentsForClass(Integer id);

	public Assignment getAssignmentById(Integer id);

	public Integer getNumberOfAssignments();

	public Integer getNumberOfAssignmentsForClass();

	public void addAssignment(Model model, Assignment assignment);

	public void deleteAssignment(Integer id);

}
