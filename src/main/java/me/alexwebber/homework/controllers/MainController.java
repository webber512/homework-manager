package me.alexwebber.homework.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import me.alexwebber.homework.model.Class;
import me.alexwebber.homework.dao.ClassRepository;

@Controller
public class MainController {

	@Autowired
	ClassRepository classRepository;

	@GetMapping(value = { "/home" })
	public String getNewBuildingView(Model model, HttpServletRequest request, HttpSession session) {

		List<Class> classList = classRepository.getAllClasses();
		System.out.print(classList.size());
		System.out.print(classList.get(0).getName());
		return "home";
	}
}
