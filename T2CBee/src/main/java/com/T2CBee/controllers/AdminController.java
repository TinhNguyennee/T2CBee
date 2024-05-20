package com.T2CBee.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("")
    public String index() {
        return "admin/index";
    }

    @GetMapping("/home")
    public String home() {
        return "admin/index";
    }

    @GetMapping("/danh-muc")
    public String danhMuc() {
        return "admin/danhmuc-form";
    }

    @GetMapping("/hoa-don")
    public String hoaDon() {
        return "admin/hoadon-form";
    }

    @GetMapping("/khach-hang")
    public String khachHang() {
        return "admin/khachhang-form";
    }

    @GetMapping("/nha-cung-cap")
    public String nhaCungCap() {
        return "admin/nhacungcap-form";
    }

    @GetMapping("/nhan-vien")
    public String nhanVien() {
        return "admin/nhanvien-form";
    }

    @GetMapping("/phieu-nhap")
    public String phieuNhap() {
        return "admin/phieunhap-form";
    }

    @GetMapping("/san-pham")
    public String sanPham() {
        return "admin/product";
    }

    @GetMapping("/chi-tiet-san-pham")
    public String chiTietSanPham() {
        return "admin/product-form";
    }

    @GetMapping("/thuong-hieu")
    public String thuongHieu() {
        return "admin/thuonghieu-form";
    }

    @GetMapping("/ma-giam-gia")
    public String maGiamGia() {
        return "admin/voucher-form";
    }

    @GetMapping("/dang-nhap")
    public String dangNhap() {
        return "admin/login";
    }

    @GetMapping("/quen-mat-khau")
    public String quenMatKhau() {
        return "admin/forgot-password";
    }

    @GetMapping("/*")
    public String handle404() {
        return "admin/404";
    }
}
