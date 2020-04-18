package me.alexwebber.homework.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.alexwebber.homework.dao.ClassRepository;
import me.alexwebber.homework.model.Class;
import me.alexwebber.homework.services.ClassService;

@Service("classService")
public class ClassServiceImpl implements ClassService {

	@Autowired
	ClassRepository classRepository;

	@Override
	public List<Class> getClasses() {
		return classRepository.getAllClasses();
	}

}
