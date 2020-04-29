package me.alexwebber.homework.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import me.alexwebber.homework.services.AssignmentService;

@Controller
public class APIController {

	@Autowired
	AssignmentService assignmentService;

	@RequestMapping(value = "/api/assignments/all", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String getAssignments() {
		Gson gson = new Gson();
		String jsonStr = gson.toJson(assignmentService.getOpenAssignments()).toString();

		StringBuilder sb = new StringBuilder();
		sb.append(jsonStr);
		return sb.toString();
	}
}
