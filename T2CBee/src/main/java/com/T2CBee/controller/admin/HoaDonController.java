package com.T2CBee.controller.admin;

import com.T2CBee.entity.GioHang;
import com.T2CBee.repository.ChiTietGioHangRepository;
import com.T2CBee.service.ChiTietGioHangService;
import com.T2CBee.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/admin/hoa-don")
public class HoaDonController {
    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private ChiTietGioHangService chiTietGioHangService;

    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listGH", gioHangService.findAll(pageable));
        return "admin/hoadon-form";
    }

    @GetMapping(value = "", params = "tt")
    public String handleFillterByStatus(Model model, @RequestParam("tt") String status, @RequestParam("p") Optional<Integer> p) {
        if(status.equals("TAT_CA")) {
            return "redirect:/admin/hoa-don";
        }
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listGH", gioHangService.findByTrangThai(status, pageable));
        return "admin/hoadon-form";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/hoa-don";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<GioHang> GioHangPage = gioHangService.findByKeyword(keyword.get(), pageable);
            if(GioHangPage != null) {
                model.addAttribute("listGH", GioHangPage);
                return "admin/hoadon-form";
            } else {
                return "redirect:/admin/hoa-don";
            }
        } else {
            return "redirect:/admin/hoa-don";
        }
    }

    @GetMapping(value = "", params = "id")
    public String handleFillterById(Model model, @RequestParam("id") Optional<Integer> maGioHang) {
        if(maGioHang.isPresent()) {
            Pageable pageable = PageRequest.of(0, 5);
            model.addAttribute("listGH", gioHangService.findAll(pageable));
            model.addAttribute("listCTGH", chiTietGioHangService.findChiTietGioHangByGioHangId(maGioHang.get(), pageable));
        }
        return "admin/hoadon-form";
    }
}
