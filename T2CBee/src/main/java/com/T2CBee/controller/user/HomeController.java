package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class HomeController {
	// Home Page
	@GetMapping("/trang-chu")
	public String home(Model model) {
		model.addAttribute("path", "page/home-page");
	    return "index";
	}

	@GetMapping("/ve-chung-toi")
	public String aboutUs(Model model) {
		model.addAttribute("path", "page/about-us");
	    return "index";
	}

}
