package me.alexwebber.homework.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import me.alexwebber.homework.dao.AssignmentRepository;
import me.alexwebber.homework.model.Assignment;
import me.alexwebber.homework.services.AssignmentService;

@Service("assignmentService")
public class AssignmentServiceImpl implements AssignmentService {

	@Autowired
	AssignmentRepository assignmentRepository;

	@Override
	public List<Assignment> getAllAssignments() {
		return assignmentRepository.getAllAssignments();
	}

	@Override
	public List<Assignment> getAssignmentsForClass(Integer id) {
		return assignmentRepository.getAssignmentsForClass(id);
	}

	@Override
	public Assignment getAssignmentById(Integer id) {
		return assignmentRepository.getAssignmentById(id);
	}

	@Override
	public Integer getNumberOfAssignments() {
		return assignmentRepository.getNumberOfAssignments();
	}

	@Override
	public Integer getNumberOfAssignmentsForClass(Integer id) {
		return assignmentRepository.getNumberOfAssignmentsForClass(id);
	}

	@Override
	public void addAssignment(Model model, Assignment assignment) {
		assignmentRepository.addAssignment(assignment);
	}

	@Override
	public void deleteAssignment(Integer id) {
		assignmentRepository.deleteAssignment(id);
	}

}
