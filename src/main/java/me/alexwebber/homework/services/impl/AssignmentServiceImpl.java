package me.alexwebber.homework.services.impl;

import java.util.List;

import org.springframework.ui.Model;

import me.alexwebber.homework.model.Assignment;
import me.alexwebber.homework.services.AssignmentService;

public class AssignmentServiceImpl implements AssignmentService {

	@Override
	public List<Assignment> getAllAssignments() {
		
		return null;
	}

	@Override
	public List<Assignment> getAssignmentsForClass(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Assignment getAssignmentById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getNumberOfAssignments() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getNumberOfAssignmentsForClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAssignment(Model model, Assignment assignment) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAssignment(Integer id) {
		// TODO Auto-generated method stub

	}

}
