package com.T2CBee.controller.admin;

import com.T2CBee.entity.KhachHang;
import com.T2CBee.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Controller
@RequestMapping("/admin/khach-hang")
public class KhachHangController {
    
    @Autowired
    private KhachHangService khachHangService;
    
    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("khachHang", new KhachHang());
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listKH", khachHangService.findAll(pageable));
        return "admin/khachhang-form";
    }

    @PostMapping("")
    public String handlePostKhachHang(KhachHang nv, BindingResult bindingResult, Model model, @RequestParam("ngaySinh") Optional<String> ngaySinh) {
        Date date = null;
        if(ngaySinh.isPresent()) {
            if(!ngaySinh.get().isBlank()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    date = sdf.parse(ngaySinh.get());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        nv.setNgaySinh(date);
        khachHangService.save(nv);
        return "redirect:/admin/khach-hang";
    }

    @GetMapping("/{id}")
    public String handleGetKhachHang(@PathVariable("id") Integer id, Model model, @RequestParam("p") Optional<Integer> p) {
        KhachHang nv = khachHangService.findById(id);
        if(nv != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("khachHang", nv);
        }

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listKH", khachHangService.findAll(pageable));
        return "admin/khachhang-form";
    }

    @GetMapping(value = "/delete", params = "id")
    public String handleDeleteKhachHang(@RequestParam("id") Integer id) {
        khachHangService.deleteById(id);
        return "redirect:/admin/khach-hang";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/khach-hang";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<KhachHang> KhachHangPage = khachHangService.findByKeyword(keyword.get(), pageable);
            if(KhachHangPage != null) {
                model.addAttribute("khachHang", new KhachHang());
                model.addAttribute("listKH", KhachHangPage);
                return "admin/khachhang-form";
            } else {
                return "redirect:/admin/khach-hang";
            }
        } else {
            return "redirect:/admin/khach-hang";
        }
    }

}
