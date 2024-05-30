package com.T2CBee.controller.admin;

import com.T2CBee.entity.NhaCungCap;
import com.T2CBee.entity.NhanVien;
import com.T2CBee.service.NhanVienService;
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
@RequestMapping("admin/nhan-vien")
public class NhanVienController {

    @Autowired
    private NhanVienService nhanVienService;

    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("nhanVien", new NhanVien());
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listNV", nhanVienService.findAll(pageable));
        return "admin/nhanvien-form";
    }

    @PostMapping("")
    public String handlePostNhanVien(NhanVien nv, BindingResult bindingResult, Model model) {
        nhanVienService.save(nv);
        return "redirect:/admin/nhan-vien";
    }

    @GetMapping("/{id}")
    public String handleGetNhanVien(@PathVariable("id") String id, Model model, @RequestParam("p") Optional<Integer> p) {
        NhanVien nv = nhanVienService.findById(id);
        if(nv != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("nhanVien", nv);
        }

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listNV", nhanVienService.findAll(pageable));
        return "admin/nhanvien-form";
    }

    @GetMapping(value = "/delete", params = "id")
    public String handleDeleteNhanVien(@RequestParam("id") String id) {
        nhanVienService.deleteById(id);
        return "redirect:/admin/nhan-vien";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/nhan-vien";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<NhanVien> nhanVienPage = nhanVienService.findByKeyword(keyword.get(), pageable);
            if(nhanVienPage != null) {
                model.addAttribute("nhanVien", new NhanVien());
                model.addAttribute("listNV", nhanVienPage);
                return "admin/nhanvien-form";
            } else {
                return "redirect:/admin/nhan-vien";
            }
        } else {
            return "redirect:/admin/nhan-vien";
        }
    }
}
