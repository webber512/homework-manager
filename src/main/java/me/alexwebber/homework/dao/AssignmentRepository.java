package me.alexwebber.homework.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	@Autowired
	ClassRepository classRepository;

	public AssignmentRepository() {

	}

	public List<Assignment> getAllAssignments() {
		String sql = "SELECT * FROM assignment";
		String sql2 = "SELECT code FROM classes WHERE id = ?";
		List<Assignment> assignmentList = template.query(sql, Homework.ASSIGNMENT);
		for (Assignment a : assignmentList) {
			String sql3 = "SELECT color FROM classes WHERE id = ?";
			Object[] args = { a.getClassId() };
			a.setClassName(template.queryForObject(sql2, args, String.class));
			a.setClassColor(template.queryForObject(sql3, args, String.class));
		}
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

	public Integer getNumberOfOpenAssignments() {
		String sql = "SELECT COUNT(*) FROM assignment WHERE completed = 'false'";
		Integer assignmentCount = template.queryForObject(sql, Integer.class);
		return assignmentCount;
	}

	public Integer getNumberOfCompletedAssignments() {
		String sql = "SELECT COUNT(*) FROM assignment WHERE completed = 'true'";
		Integer assignmentCount = template.queryForObject(sql, Integer.class);
		return assignmentCount;
	}

	public Integer getNumberOfOpenAssignmentsForClass(Integer id) {
		String sql = "SELECT COUNT(*) FROM assignment WHERE classId = ? AND completed = 'false'";
		Object[] args = { id };
		Integer assignmentCount = template.queryForObject(sql, args, Integer.class);
		classRepository.getClassById(id).setNumberOfAssignments(assignmentCount);
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

	public List<Assignment> getCompletedAssignments() {
		String sql = "SELECT * FROM assignment WHERE completed = 'true'";
		List<Assignment> assignmentList = template.query(sql, Homework.ASSIGNMENT);
		return assignmentList;
	}

	public List<Assignment> getOpenAssignments() {
		String sql = "SELECT * FROM assignment WHERE completed = 'false'";
		List<Assignment> assignmentList = template.query(sql, Homework.ASSIGNMENT);
		for (Assignment a : assignmentList) {
			String sql2 = "SELECT code FROM classes WHERE id = ?";
			String sql3 = "SELECT color FROM classes WHERE id = ?";
			Object[] args = { a.getClassId() };
			a.setClassName(template.queryForObject(sql2, args, String.class));
			a.setClassColor(template.queryForObject(sql3, args, String.class));
		}
		return assignmentList;
	}

	public void markAssignmentCompleted(Integer id) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(f.format(new Date()));
		String sql = "UPDATE assignment SET completedDate = ?, completed = 'true' WHERE id = ?";
		String sql2 = "SELECT classId from assignment WHERE id = ?";
		Object[] args = { f.format(new Date()), id };
		Object[] args2 = { id };
		template.update(sql, args);
		Integer cId = template.queryForObject(sql2, args2, Integer.class);
		getNumberOfOpenAssignmentsForClass(cId);
	}

	public void markAssignmentIncomplete(Integer id) {
		String sql = "UPDATE assignment SET completedDate = ?, completed = 'false' WHERE id = ?";
		Object[] args = { null, id };
		template.update(sql, args);
	}
}
