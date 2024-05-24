package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProductsController {
//	@GetMapping("/products/checkout")
//	public String Checkout() {
//		return "products/Checkout";
//	}
//	@GetMapping("/products/productdetail")
//	public String ProductDetail() {
//		return "products/ProductDetail";
//	}
	
	// Product Details
		@GetMapping("/chi-tiet-san-pham")
		public String productDetails(Model model) {
			model.addAttribute("path", "page/product-details");
		    return "index";
		}
		// Check Out
		@GetMapping("/thanh-toan")
		public String checkout(Model model) {
			model.addAttribute("path", "page/checkout");
		    return "index";
		}
	
	@GetMapping("products/cart")
	public String cart() {
	    return "products/cart";
	}

	@GetMapping("products/listproduct")
	public String getMethodName() {
	    return "products/list-product";
	}
	
}
