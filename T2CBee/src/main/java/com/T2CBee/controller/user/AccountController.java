package com.T2CBee.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.T2CBee.entity.NhanVien;
import com.T2CBee.repository.NhanVienRepository;
import com.T2CBee.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;


@Controller
public class AccountController {

	@Autowired
	NhanVienRepository repository;
	@Autowired
	SessionService session;

	@GetMapping("/dang-nhap")
	public String login() {
		return "account/login";
	}

	@PostMapping("/dang-nhap")
	public String login(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletResponse response) {
		session.remove("user");
		try {
			NhanVien user = repository.getOne(username);
			if (!user.getMatKhau().equals(password)) {
				model.addAttribute("message", "Invalid password");

			} else {
//				System.out.println("hellow "+user.getId());
				
				
				String uri = session.get("security-uri");
				
				
				if (uri != null) {

					session.set("user", user);
					return "redirect:" + uri;
				} else {
					session.set("user", user);
					model.addAttribute("message", "Login succeed");
					System.out.println(user.getHoTen());
					response.sendRedirect("/trang-chu");
				}
				
				
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
//			System.out.println("hellow2");
		}
		return "account/login";

	}
	
	
	@GetMapping("dang-xuat")
	public String dangxuat() {
		session.remove("user");
		return "redirect:/trang-chu";
	}
	
	

	@GetMapping("/dang-ky")
	public String register() {
		return "account/register";
	}

}
