package com.T2CBee.controller.admin;

import com.T2CBee.entity.DanhMuc;
import com.T2CBee.entity.DanhMuc;
import com.T2CBee.entity.NhanVien;
import com.T2CBee.service.*;
import com.T2CBee.service.DanhMucService;
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
@RequestMapping("/admin/danh-muc")
public class DanhMucController {
    
    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private SessionService sessionService;

    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("danhMuc", new DanhMuc());
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listDM", danhMucService.findAll(pageable));
        return "admin/danhmuc-form";
    }

    @PostMapping("")
    public String handlePostDanhMuc(DanhMuc dm, BindingResult bindingResult, Model model) {
        NhanVien nv = sessionService.get("nhanVien");
        dm.setNguoiThem(nv);
        danhMucService.save(dm);
        return "redirect:/admin/danh-muc";
    }

    @GetMapping("/{id}")
    public String handleGetDanhMuc(@PathVariable("id") Integer id, Model model, @RequestParam("p") Optional<Integer> p) {
        DanhMuc nv = danhMucService.findById(id);
        if(nv != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("danhMuc", nv);
        }

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listDM", danhMucService.findAll(pageable));
        return "admin/danhmuc-form";
    }

    @GetMapping(value = "/delete", params = "id")
    public String handleDeleteDanhMuc(@RequestParam("id") Integer id) {
        danhMucService.deleteById(id);
        return "redirect:/admin/danh-muc";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/danh-muc";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<DanhMuc> DanhMucPage = danhMucService.findByKeyword(keyword.get(), pageable);
            if(DanhMucPage != null) {
                model.addAttribute("danhMuc", new DanhMuc());
                model.addAttribute("listDM", DanhMucPage);
                return "admin/danhmuc-form";
            } else {
                return "redirect:/admin/danh-muc";
            }
        } else {
            return "redirect:/admin/danh-muc";
        }
    }
}
