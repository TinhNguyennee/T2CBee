package com.T2CBee.controller.admin;

import com.T2CBee.entity.PhieuNhapHang;
import com.T2CBee.service.NhaCungCapService;
import com.T2CBee.service.NhanVienService;
import com.T2CBee.service.PhieuNhapHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/admin/phieu-nhap")
public class PhieuNhapHangController {
    
    @Autowired
    private PhieuNhapHangService phieuNhapHangService;

    @Autowired
    private NhaCungCapService nhaCungCapService;

    @Autowired
    private NhanVienService nhanVienService;

    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("phieuNhapHang", new PhieuNhapHang());

        model.addAttribute("listNCC", nhaCungCapService.findAll());

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listPN", phieuNhapHangService.findAll(pageable));
        return "admin/phieunhap-form";
    }

    @PostMapping("")
    public String handlePostPhieuNhapHang(PhieuNhapHang pn, BindingResult bindingResult, Model model) {
//        pn.setNhaCungCap(nhaCungCapService.findById("Hiroshima"));
        pn.setNguoiNhap(nhanVienService.findById("NV01"));
        phieuNhapHangService.save(pn);
        return "redirect:/admin/phieu-nhap";
    }

    @GetMapping("/{id}")
    public String handleGetPhieuNhapHang(@PathVariable("id") String id, Model model, @RequestParam("p") Optional<Integer> p) {
        PhieuNhapHang nv = phieuNhapHangService.findById(id);
        if(nv != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("listNCC", nhaCungCapService.findAll());
            model.addAttribute("phieuNhapHang", nv);
        }

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listPN", phieuNhapHangService.findAll(pageable));
        return "admin/phieunhap-form";
    }

    @GetMapping(value = "/delete", params = "id")
    public String handleDeletePhieuNhapHang(@RequestParam("id") String id) {
        phieuNhapHangService.deleteById(id);
        return "redirect:/admin/phieu-nhap";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/phieu-nhap";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<PhieuNhapHang> PhieuNhapHangPage = phieuNhapHangService.findByKeyword(keyword.get(), pageable);
            if(PhieuNhapHangPage != null) {
                model.addAttribute("phieuNhapHang", new PhieuNhapHang());
                model.addAttribute("listNCC", nhaCungCapService.findAll());
                model.addAttribute("listPN", PhieuNhapHangPage);
                return "admin/phieunhap-form";
            } else {
                return "redirect:/admin/phieu-nhap";
            }
        } else {
            return "redirect:/admin/phieu-nhap";
        }
    }
}
