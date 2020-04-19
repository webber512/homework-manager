package me.alexwebber.homework.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import me.alexwebber.homework.model.Assignment;
import me.alexwebber.homework.model.Class;
import me.alexwebber.homework.services.AssignmentService;
import me.alexwebber.homework.services.ClassService;

@Controller
public class MainController {

	@Autowired
	ClassService classService;
	@Autowired
	AssignmentService assignmentService;

	@GetMapping(value = { "/home", "/" })
	public String getHomeView(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("title", "Homework Manager");
		model.addAttribute("numberOfOpenAssignments", assignmentService.getNumberOfOpenAssignments());
		model.addAttribute("numberOfAssignments", assignmentService.getNumberOfAssignments());
		model.addAttribute("numberOfCompletedAssignments", assignmentService.getNumberOfCompletedAssignments());

		double progress = (double) assignmentService.getNumberOfCompletedAssignments()
				/ assignmentService.getNumberOfAssignments();
		System.out.println(progress);
		model.addAttribute("progress", progress * 100);

		model.addAttribute("classList", classService.getClasses());
		model.addAttribute("command", new Assignment());
		model.addAttribute("assignmentList", assignmentService.getOpenAssignments());
		return "home";
	}

	@PostMapping(value = { "/assignment/new" })
	public String postAddAssignment(HttpSession session, Model model, Assignment assignment) {
		model.addAttribute("classList", classService.getClasses());
		assignmentService.addAssignment(model, assignment);
		model.addAttribute("assignmentList", assignmentService.getOpenAssignments());
		return "redirect:/home";
	}

	@GetMapping(value = { "/assignment/done/{id}" })
	public String postCompleteAssignment(HttpSession session, Model model, @PathVariable Integer id) {
		assignmentService.markAssignmentCompleted(id);
		return "redirect:/home";
	}

	@GetMapping(value = { "/classes" })
	public String getNewClassView(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("title", "Classes");
		List<Class> classList = classService.getClasses();
		model.addAttribute("classList", classList);
		model.addAttribute("command", new Class());
		return "newclass";
	}

	@PostMapping(value = { "/classes" })
	public String postAddBuilding(HttpSession session, Model model, Class myClass) {
		classService.addClass(model, myClass);
		return "redirect:/class/new";
	}

}