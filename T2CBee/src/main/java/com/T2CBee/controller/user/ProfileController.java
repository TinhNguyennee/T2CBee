package com.T2CBee.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {
    // Profile Page
    @GetMapping("/thong-tin")
    public String profile(Model model) {
        model.addAttribute("path", "page/profile/information");
        return "index";
    }

    @GetMapping("/don-hang-cua-toi")
    public String myorders(Model model) {
        model.addAttribute("path", "page/profile/myorders");
        return "index";
    }

    @GetMapping("/danh-sach-yeu-thich")
    public String wishlist(Model model) {
        model.addAttribute("path", "page/profile/wishlist");
        return "index";
    }

    @GetMapping("/tai-khoan-chi-tiet")
    public String accountdetails(Model model) {
        model.addAttribute("path", "page/profile/accountdetails");
        return "index";
    }

    @GetMapping("/so-dia-chi")
    public String addressbook(Model model) {
        model.addAttribute("path", "page/profile/addressbook");
        return "index";
    }
}
