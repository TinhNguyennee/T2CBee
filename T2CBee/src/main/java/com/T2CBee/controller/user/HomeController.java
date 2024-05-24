package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class HomeController {
	// Home Page
	@GetMapping("/index")
	public String home(Model model) {
		model.addAttribute("path", "page/home-page");
	    return "index";
	}

	// Profile Page
	@GetMapping("/profile/information")
	public String profile(Model model) {
		model.addAttribute("path", "page/profile/information");
	    return "index";
	}

	@GetMapping("/profile/myorders")
	public String myorders(Model model) {
		model.addAttribute("path", "page/profile/myorders");
	    return "index";
	}

	@GetMapping("/profile/wishlist")
	public String wishlist(Model model) {
		model.addAttribute("path", "page/profile/wishlist");
	    return "index";
	}

	@GetMapping("/profile/accountdetails")
	public String accountdetails(Model model) {
		model.addAttribute("path", "page/profile/accountdetails");
	    return "index";
	}
	@GetMapping("/profile/addressbook")
	public String addressbook(Model model) {
		model.addAttribute("path", "page/profile/addressbook");
	    return "index";
	}

	// Cart
	@GetMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("path", "page/cart");
	    return "index";
	}

	// Check Out
	@GetMapping("/checkout")
	public String checkout(Model model) {
		model.addAttribute("path", "page/checkout");
	    return "index";
	}

	// List Product
	@GetMapping("/list-product")
	public String listProduct(Model model) {
		model.addAttribute("path", "page/list-product");
	    return "index";
	}

	// Product Details
	@GetMapping("/product-details")
	public String productDetails(Model model) {
		model.addAttribute("path", "page/product-details");
	    return "index";
	}
}
