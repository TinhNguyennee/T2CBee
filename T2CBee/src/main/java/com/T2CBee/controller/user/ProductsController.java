package com.T2CBee.controller.user;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.BinhLuan;
import com.T2CBee.entity.SanPham;
import com.T2CBee.service.SanPhamService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.T2CBee.entity.SanPham;
import com.T2CBee.service.SanPhamService;
import com.T2CBee.service.SessionService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductsController {
	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	SessionService sessionService;

	Page<SanPham> lstProducts;

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

	@GetMapping("/danh-sach-san-pham/{danh-muc}")
	public String danhMucSort(
			@RequestParam("p") Optional<Integer> p,
			@PathVariable("danh-muc") String danhMuc,
			@RequestParam("sort") Optional<String> sort,
			Model model) {

		int currentPage = p.orElse(0);
		int pageSize = 9;
		Sort sortDirection = Sort.unsorted();

		if (sort.isPresent()) {
			String sortParam = sort.get();
			if (sortParam.contains("az")) {
				sortDirection = Sort.by("tenSanPham").ascending();
			} else if (sortParam.contains("za")) {
				sortDirection = Sort.by("tenSanPham").descending();
			} else if (sortParam.contains("priceAsc")) {
				sortDirection = Sort.by("giaBan").ascending();
			} else if (sortParam.contains("priceDesc")) {
				sortDirection = Sort.by("giaBan").descending();
			} else if (sortParam.contains("newest")) {
				sortDirection = Sort.by("ngayTao").descending();
			} else if (sortParam.contains("oldest")) {
				sortDirection = Sort.by("ngayTao").ascending();
			}
		}

		Pageable pageable = PageRequest.of(currentPage, pageSize, sortDirection);
		Page<SanPham> lstProducts;

		Double minPrice = (Double) sessionService.get("minPrice");
		Double maxPrice = (Double) sessionService.get("maxPrice");

		if (minPrice == null || maxPrice == null) {
			minPrice = 1000000.0;
			maxPrice = 5000000.0;
			sessionService.set("minPrice", minPrice);
			sessionService.set("maxPrice", maxPrice);
		}

		if (danhMuc.equalsIgnoreCase("Tất Cả")) {
			lstProducts = sanPhamService.findByPriceBetween(minPrice, maxPrice, pageable);
		} else {
			lstProducts = sanPhamService.findByDanhMucAndGiaBetween(danhMuc, minPrice, maxPrice, pageable);
		}

		model.addAttribute("sort", sort.orElse(""));
		model.addAttribute("pageNumber", currentPage);
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("danhMuc", danhMuc);
		model.addAttribute("page", lstProducts);
		model.addAttribute("path", "page/list-product");

		return "index";
	}

	@PostMapping("/danh-sach-san-pham/{danh-muc}")
	public String post(
			@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max,
			@RequestParam("p") Optional<Integer> p,
			@PathVariable("danh-muc") String danhMuc,
			@RequestParam("sort") Optional<String> sort,
			Model model) {

		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		sessionService.set("minPrice", minPrice);
		sessionService.set("maxPrice", maxPrice);

		return danhMucSort(p, danhMuc, sort, model);
	}

}
