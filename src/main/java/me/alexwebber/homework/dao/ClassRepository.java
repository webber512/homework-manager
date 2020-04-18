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
		return classList;

	}
}
