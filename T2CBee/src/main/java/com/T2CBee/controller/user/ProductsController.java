package com.T2CBee.controller.user;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.BinhLuan;
import com.T2CBee.entity.SanPham;
import com.T2CBee.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductsController {

	// Product Details
	@Autowired
	SanPhamService daoSanPham;

	// Product Details
	@GetMapping("/chi-tiet-san-pham/{id}")
	public String productDetails(Model model, @PathVariable(name = "id") Integer id,
								 @RequestParam(name = "productType", required = false) Optional<String> productType) {
		SanPham sp = daoSanPham.findById(id);
		String group = sp.getGroupId().trim();
		List<AnhSanPham> lstPicture = daoSanPham.findAllPictureByGroupId(group);
		List<Double> min_max_giaBan = new ArrayList<>();
		Double minPrice = daoSanPham.findMinPriceByGroupId(group);
		Double maxPrice = daoSanPham.findMaxPriceByGroupId(group);
		if (minPrice.equals(maxPrice)) {
			min_max_giaBan.add(minPrice);
		} else {
			min_max_giaBan.add(minPrice);
			min_max_giaBan.add(maxPrice);
		}
		List<String> chiTietLoai = daoSanPham.findDistinctPhanLoaiByGroupId(group);

		int soDanhGia = daoSanPham.countTotalReviewsByGroupId(group);
		if (productType.isPresent()) {
			sp = daoSanPham.findSanPhamByPhanLoaiAndGroup(group, productType);
		}
		List<BinhLuan> lstBinhLuan = daoSanPham.findAllBinhLuanByGroupId(group);
		List<String> lstDanhMuc = daoSanPham.findDanhMucNamesByGroupId(group);
		model.addAttribute("soDanhGia", soDanhGia);
		model.addAttribute("chiTietLoai", chiTietLoai);
		model.addAttribute("min_max_giaBan", min_max_giaBan);
		model.addAttribute("sp", sp);
		model.addAttribute("lstDanhMuc", lstDanhMuc);
		model.addAttribute("imgs", lstPicture);
		model.addAttribute("cmts", lstBinhLuan);
		model.addAttribute("path", "page/product-details");
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
