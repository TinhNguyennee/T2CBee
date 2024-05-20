package com.T2CBee.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



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



}
