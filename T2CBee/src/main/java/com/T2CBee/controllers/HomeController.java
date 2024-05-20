package com.T2CBee.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {
	@GetMapping("home/index")
	public String home(@PathVariable("path") String path, Model model) {
	    model.addAttribute("path", path);
	    return "home/index";
	}

	@RequestMapping("{x}")
	public String requestMethodName(@PathVariable("x") String x, Model model) {
	    model.addAttribute("path", x);
	    return "home/index";
	}



}
