package com.T2CBee.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class HomeController {
@GetMapping("home/index")
public String home() {
    return "home/index";
}
@GetMapping("home/cart")
public String cart() {
    return "home/cart";
}

@GetMapping("home/listproduct")
public String getMethodName() {
    return "home/list-product";
}

@RequestMapping("home/{x}")
public String requestMethodName(@PathVariable("x")String x,Model model) {
	
	model.addAttribute("pathx",x);
	
   return "home/index";
}


}
