package com.T2CBee.controller.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.T2CBee.entity.SanPham;
import com.T2CBee.repository.SanPhamRepository;
import com.T2CBee.service.SanPhamService;

@Controller
public class HomeController {
	@Autowired
	private SanPhamService sanPhamService;

	// Home Page
	@GetMapping("/trang-chu")
	public String show(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		model.addAttribute("page", sanPhamService.findAll(pageable));
		model.addAttribute("listSanPhamNoiBat", sanPhamService.findAll());
		model.addAttribute("listSanPhamMoi", sanPhamService.findNewProducts());
		model.addAttribute("path", "page/home-page");
		return "index";
	}

	@GetMapping("/trang-chu/{danh-muc}")
	public String home(Model model, @PathVariable("danh-muc") Optional<String> danhMuc,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<SanPham> page;
		if (danhMuc.isPresent()) {
			page = sanPhamService.findByDanhMuc(danhMuc.get(), pageable);
		} else {
			page = sanPhamService.findAll(pageable);
		}
		model.addAttribute("page", page);
		model.addAttribute("path", "page/home-page");
		model.addAttribute("listSanPhamNoiBat", sanPhamService.findAll());
		model.addAttribute("listSanPhamMoi", sanPhamService.findNewProducts());
		return "index";
	}

	@GetMapping("/ve-chung-toi")
	public String aboutUs(Model model) {
		model.addAttribute("path", "page/about-us");
		return "index";
	}

}
