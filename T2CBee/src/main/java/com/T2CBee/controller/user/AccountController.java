package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AccountController {
@GetMapping("/dang-nhap")
public String login() {
    return "account/login";
}
@GetMapping("/dang-ky")
public String register() {
	return "account/register";
}

}
