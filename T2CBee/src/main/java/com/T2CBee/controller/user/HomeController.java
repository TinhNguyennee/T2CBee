package com.T2CBee.controller.user;

import com.T2CBee.entity.SanPham;
import com.T2CBee.service.ChiTietDanhMucService;
import com.T2CBee.service.GioHangService;
import com.T2CBee.service.SanPhamService;
import com.T2CBee.service.SessionService;
import com.T2CBee.util.CartMiniUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    SessionService sessionService;
    @Autowired
    CartMiniUtil cartMiniUtil;
    @Autowired
    GioHangService gioHangDao;
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private ChiTietDanhMucService chiTietDanhMucService;

    @GetMapping("/trang-chu")
    public String show(Model model, @RequestParam("p") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 9);
        model.addAttribute("page", sanPhamService.findAll(pageable));
        model.addAttribute("listSanPhamNoiBat", sanPhamService.findAll());
        model.addAttribute("listSanPhamMoi", sanPhamService.findNewProducts());
        model.addAttribute("listDanhMuc", chiTietDanhMucService.getAllDanhMucs());
        model.addAttribute("path", "page/home-page");
        cartMiniUtil.showCartMini(model);
        return "index";
    }

    // Home Page
//	@GetMapping("/trang-chu")
//	public String show(Model model, @RequestParam("p") Optional<Integer> p) {
////		KhachHang kh = sessionService.get("user");
////		GioHang cart = gioHangDao.findByMaKhachHangAndTrangThaiIsNull(kh.getMaKhachHang());
////		List<ChiTietGioHang> lstItemCart = gioHangDao.findAllByMaKhachHangAndMaGioHang(kh.getMaKhachHang(), cart.getId());
////		sessionService.set("cartItem", lstItemCart);
//
//		Pageable pageable = PageRequest.of(p.orElse(0), 9);
//		model.addAttribute("page", sanPhamService.findAll(pageable));
//		model.addAttribute("listSanPhamNoiBat", sanPhamService.findAll());
//		model.addAttribute("listSanPhamMoi", sanPhamService.findNewProducts());
//		model.addAttribute("listDanhMuc", chiTietDanhMucService.getAllDanhMucs());
//		model.addAttribute("path", "page/home-page");
//		return "index";
//	}

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
        model.addAttribute("listDanhMuc", chiTietDanhMucService.getAllDanhMucs());
        return "index";
    }

    @GetMapping("/ve-chung-toi")
    public String aboutUs(Model model) {
        model.addAttribute("path", "page/about-us");
        return "index";
    }

}
