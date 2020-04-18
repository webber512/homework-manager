package me.alexwebber.homework.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import me.alexwebber.homework.model.Assignment;
import me.alexwebber.homework.util.Homework;

@Repository
public class AssignmentRepository {
	@Autowired
	JdbcTemplate template;

	public AssignmentRepository() {

	}

	public List<Assignment> getAllAssignments() {
		String sql = "SELECT * FROM assignment";
		List<Assignment> assignmentList = template.query(sql, Homework.ASSIGNMENT);
		return assignmentList;
	}

	public List<Assignment> getAssignmentsForClass(Integer id) {
		String sql = "SELECT * FROM assignment WHERE classId = ?";
		Object[] args = { id };
		List<Assignment> assignmentList = template.query(sql, args, Homework.ASSIGNMENT);
		return assignmentList;
	}

	public Assignment getAssignmentById(Integer id) {
		String sql = "SELECT * FROM assignment WHERE id = ?";
		Object[] args = { id };
		Assignment assignment = template.queryForObject(sql, args, Homework.ASSIGNMENT);
		return assignment;
	}

	public Integer getNumberOfAssignments() {
		String sql = "SELECT COUNT(*) FROM assignment";
		Integer assignmentCount = template.queryForObject(sql, Integer.class);
		return assignmentCount;
	}

	public Integer getNumberOfAssignmentsForClass(Integer id) {
		String sql = "SELECT COUNT(*) FROM assignment WHERE classId = ?";
		Object[] args = { id };
		Integer assignmentCount = template.queryForObject(sql, args, Integer.class);
		return assignmentCount;
	}

	public void addAssignment(Assignment assignment) {
		String sql = "INSERT INTO assignment (name, type, classId, description, dueDate)" + " VALUES (?, ?, ?, ?, ?)";
		Object[] args = { assignment.getName(), assignment.getType(), assignment.getClassId(),
				assignment.getDescription(), assignment.getDueDate() };
		template.update(sql, args);
	}

	public void deleteAssignment(Integer id) {
		String sql = "DELETE FROM assignment WHERE id = ?";
		Object[] args = { id };
		template.update(sql, args);
	}
}
