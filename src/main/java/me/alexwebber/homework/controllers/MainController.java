package me.alexwebber.homework.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import me.alexwebber.homework.model.Class;
import me.alexwebber.homework.services.ClassService;

@Controller
public class MainController {

	@Autowired
	ClassService classService;

	@GetMapping(value = { "/home", "/" })
	public String getHomeView(Model model, HttpServletRequest request, HttpSession session) {
		return "home";
	}

	@GetMapping(value = { "/class/new" })
	public String getNewClassView(Model model, HttpServletRequest request, HttpSession session) {
		List<Class> classList = classService.getClasses();

		model.addAttribute("classList", classList);
		model.addAttribute("command", new Class());
		return "newclass";
	}

	@PostMapping(value = { "/class/new" })
	public String postAddBuilding(HttpSession session, Model model, Class myClass) {
		classService.addClass(model, myClass);
		return "redirect:/class/new";
	}
}