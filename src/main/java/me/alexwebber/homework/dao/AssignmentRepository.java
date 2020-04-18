package me.alexwebber.homework.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AssignmentRepository {
	@Autowired
	JdbcTemplate template;

	public AssignmentRepository() {

	}
}
