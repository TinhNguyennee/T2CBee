package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductsController {

	// Product Details
	@GetMapping("/chi-tiet-san-pham")
	public String productDetails(Model model) {
		model.addAttribute("path", "page/product-details");
		model.addAttribute("testImg", "test123");
		return "index";
	}

	// Check Out
	@GetMapping("/thanh-toan")
	public String checkout(Model model) {
		model.addAttribute("path", "page/checkout");
		return "index";
	}

	@GetMapping("/gio-hang")
	public String cart(Model model) {
		model.addAttribute("path", "page/cart");
		return "index";
	}

	@GetMapping("/danh-sach-san-pham")
	public String listProducts(Model model) {
		model.addAttribute("path", "page/list-product");
		return "index";
	}

}
