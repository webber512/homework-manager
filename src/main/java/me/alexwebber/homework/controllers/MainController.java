package me.alexwebber.homework.controllers;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		double progressPercent = progress * 100;
		DecimalFormat df = new DecimalFormat("0.00");
		model.addAttribute("progress", df.format(progressPercent));
		model.addAttribute("classList", classService.getClasses());
		model.addAttribute("command", new Assignment());
		model.addAttribute("openAssignmentList", assignmentService.getOpenAssignments());
		model.addAttribute("allAssignmentList", assignmentService.getAllAssignments());
		return "home";
	}

	@GetMapping(value = "/assignment")
	public String getAddEditAssignment(Model model, HttpServletRequest request, HttpSession session, String action,
			String id) {
		if (action.equals("edit")) {
			Assignment assignment = assignmentService.getAssignmentById(Integer.parseInt(id));
			if (assignment != null) {
				model.addAttribute("pageAction", "Edit Assignment " + assignment.getName());
				model.addAttribute("classList", classService.getClasses());
				model.addAttribute("command", assignment);
				return "editAssignment";
			} else {
				return "home";
			}
		} else if (action.equals("delete")) {
			assignmentService.deleteAssignment(Integer.parseInt(id));
		} else if (action.equals("complete")) {
			assignmentService.markAssignmentCompleted(Integer.parseInt(id));
		} else if (action.equals("uncomplete")) {
			assignmentService.markAssignmentIncomplete(Integer.parseInt(id));
		}
		return "redirect:/home";
	}

	@PostMapping(value = { "/assignment" })
	public String postEditAssignment(HttpSession session, Model model, Assignment assignment) {
		if (assignment != null && assignment.getId() != null) {
			assignmentService.updateAssignment(model, assignment);
		} else {
			return "home";
		}
		return "redirect:/home";

	}

	@PostMapping(value = { "/assignment/new" })
	public String postAddAssignment(HttpSession session, Model model, Assignment assignment) {
		model.addAttribute("classList", classService.getClasses());
		assignmentService.addAssignment(model, assignment);
		model.addAttribute("assignmentList", assignmentService.getOpenAssignments());
		return "redirect:/home";
	}

	@GetMapping(value = { "/classes" })
	public String getNewClassView(Model model, HttpServletRequest request, HttpSession session, String action,
			String id) {
		model.addAttribute("title", "Classes");
		List<Class> classList = classService.getClasses();
		model.addAttribute("classList", classList);
		if (action == null) {
			model.addAttribute("action", "new");
			model.addAttribute("command", new Class());
		} else {
			if (action.equals("view")) {
				Class mClass = classService.getClassById(Integer.parseInt(id));
				if (mClass != null) {
					model.addAttribute("pageAction", "Edit Class " + mClass.getName());
					model.addAttribute("allAssignmentList",
							assignmentService.getAssignmentsForClass(Integer.parseInt(id)));
					model.addAttribute("command", mClass);
					model.addAttribute("className", mClass.getName());
				}
			} else if (action.equalsIgnoreCase("new")) {
				model.addAttribute("action", "new");
				model.addAttribute("command", new Class());
			}
		}
		return "classes";

	}

	@PostMapping(value = { "/class/new" })
	public String postAddBuilding(HttpSession session, Model model, Class myClass) {
		classService.addClass(model, myClass);
		return "redirect:/home";
	}

}