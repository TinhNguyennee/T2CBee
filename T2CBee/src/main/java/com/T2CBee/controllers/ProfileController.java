package com.T2CBee.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ProfileController {
	@GetMapping("/profile/information")
	public String profile() {
	    return "profile/information";
	}
	@GetMapping("/profile/myorders")
	public String myorders() {
	    return "profile/myorders";
	}
	@GetMapping("/profile/wishlist")
	public String wishlist() {
		return "profile/wishlist";
	}
	@GetMapping("/profile/accountdetails")
	public String accountdetails() {
		return "profile/accountdetails";
	}
	@GetMapping("/profile/addressbook")
	public String addressbook() {
		return "profile/addressbook";
	}
}
