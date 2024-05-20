package com.T2CBee.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProductsController {
	@GetMapping("/products/checkout")
	public String Checkout() {
		return "products/Checkout";
	}
	@GetMapping("/products/productdetail")
	public String ProductDetail() {
		return "products/ProductDetail";
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
