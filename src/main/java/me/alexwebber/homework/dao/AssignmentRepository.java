package me.alexwebber.homework.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import me.alexwebber.homework.model.Assignment;

@Repository
public class AssignmentRepository {
	@Autowired
	JdbcTemplate template;

	public AssignmentRepository() {

	}

	public List<Assignment> getAllAssignments() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Assignment> getAssignmentsForClass(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Assignment getAssignmentById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer getNumberOfAssignments() {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer getNumberOfAssignmentsForClass(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addAssignment(Assignment assignment) {
		// TODO Auto-generated method stub
	}

	public void deleteAssignment(Integer id) {
		// TODO Auto-generated method stub
		
	}
}
