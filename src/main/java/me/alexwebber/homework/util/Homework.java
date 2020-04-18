package me.alexwebber.homework.util;

import org.springframework.jdbc.core.BeanPropertyRowMapper;

import me.alexwebber.homework.model.Assignment;
import me.alexwebber.homework.model.Class;

public class Homework {
	public static final BeanPropertyRowMapper<Class> CLASS = new BeanPropertyRowMapper<Class>(Class.class);
	public static final BeanPropertyRowMapper<Assignment> ASSIGNMENT = new BeanPropertyRowMapper<Assignment>(
			Assignment.class);

}
