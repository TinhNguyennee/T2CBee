package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AccountController {
@GetMapping("/account/login")
public String login() {
    return "account/Login";
}
@GetMapping("/account/register")
public String register() {
	return "account/Register";
}

}
