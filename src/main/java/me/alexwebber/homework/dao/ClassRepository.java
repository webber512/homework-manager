package me.alexwebber.homework.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import me.alexwebber.homework.model.Class;
import me.alexwebber.homework.util.Homework;

@Repository
public class ClassRepository {

	@Autowired
	JdbcTemplate template;

	public ClassRepository() {

	}

	public List<Class> getAllClasses() {
		String sql = "SELECT * FROM classes";
		List<Class> classList = template.query(sql, Homework.CLASS);
		for (Class c : classList) {
			c.setNumberOfAssignments(numberOfOpenAssignmentsForClass(c.getId()));
		}
		return classList;
	}

	public void addClass(Class myClass) {
		String sql = "INSERT INTO classes (code, color, name, professor) VALUES (?, ?, ?, ?)";
		Object[] args = { myClass.getCode(), myClass.getColor(), myClass.getName(), myClass.getProfessor() };
		template.update(sql, args);
	}

	public void deleteClass(Integer id) {
		String sql = "DELETE * FROM classes WHERE id = ?";
		Object[] args = { id };
		template.update(sql, args);
	}

	public Class getClassById(Integer id) {
		String sql = "SELECT * FROM classes WHERE id = ?";
		Object[] args = { id };
		return template.queryForObject(sql, args, Homework.CLASS);
	}

	public Integer numberOfOpenAssignmentsForClass(Integer id) {
		String sql = "SELECT COUNT(*) FROM assignment WHERE classId = ? AND completed = 'false'";
		Object[] args = { id };
		Integer assignmentCount = template.queryForObject(sql, args, Integer.class);
		return assignmentCount;
	}

}
