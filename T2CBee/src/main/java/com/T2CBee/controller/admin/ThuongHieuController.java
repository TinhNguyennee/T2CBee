package com.T2CBee.controller.admin;

import com.T2CBee.entity.NhanVien;
import com.T2CBee.entity.ThuongHieu;
import com.T2CBee.service.NhanVienService;
import com.T2CBee.service.SessionService;
import com.T2CBee.service.ThuongHieuService;
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
@RequestMapping("/admin/thuong-hieu")
public class ThuongHieuController {

    @Autowired
    private ThuongHieuService thuongHieuService;

    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private SessionService sessionService;

    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("thuongHieu", new ThuongHieu());
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listTH", thuongHieuService.findAll(pageable));
        return "admin/thuonghieu-form";
    }

    @PostMapping("")
    public String handlePostThuongHieu(ThuongHieu th, BindingResult bindingResult, Model model) {
        NhanVien nv = sessionService.get("nhanVien");
        th.setNguoiThem(nv);
        thuongHieuService.save(th);
        return "redirect:/admin/thuong-hieu";
    }

    @GetMapping("/{id}")
    public String handleGetThuongHieu(@PathVariable("id") String id, Model model, @RequestParam("p") Optional<Integer> p) {
        ThuongHieu nv = thuongHieuService.findById(id);
        if(nv != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("thuongHieu", nv);
        }

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listTH", thuongHieuService.findAll(pageable));
        return "admin/thuonghieu-form";
    }

    @GetMapping(value = "/delete", params = "id")
    public String handleDeleteThuongHieu(@RequestParam("id") String id) {
        thuongHieuService.deleteById(id);
        return "redirect:/admin/thuong-hieu";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/thuong-hieu";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<ThuongHieu> thuongHieuPage = thuongHieuService.findByKeyword(keyword.get(), pageable);
            if(thuongHieuPage != null) {
                model.addAttribute("thuongHieu", new ThuongHieu());
                model.addAttribute("listTH", thuongHieuPage);
                return "admin/thuonghieu-form";
            } else {
                return "redirect:/admin/thuong-hieu";
            }
        } else {
            return "redirect:/admin/thuong-hieu";
        }
    }
}
