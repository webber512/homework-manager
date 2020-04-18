package me.alexwebber.homework.services;

import java.util.List;

import org.springframework.ui.Model;

import me.alexwebber.homework.model.Class;

public interface ClassService {

	public List<Class> getClasses();

	public void addClass(Model model, Class myClass);

	public void deleteClass(Integer id);
	
	public Class getClassById(Integer id);
}
