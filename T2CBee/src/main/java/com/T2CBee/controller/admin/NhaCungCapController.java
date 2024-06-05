package com.T2CBee.controller.admin;

import com.T2CBee.entity.NhaCungCap;
import com.T2CBee.entity.NhanVien;
import com.T2CBee.service.NhaCungCapService;
import com.T2CBee.service.NhaCungCapServiceImpl;
import com.T2CBee.service.NhanVienService;
import com.T2CBee.service.SessionService;
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
@RequestMapping("admin/nha-cung-cap")
public class NhaCungCapController {

    @Autowired
    NhaCungCapService nhaCungCapService;
    @Autowired
    NhanVienService nhanVienService;
    @Autowired
    private SessionService sessionService;

    @GetMapping("")
    public String nhaCungCap(Model model, @RequestParam("p") Optional<Integer> p) {
        //set model cho spring form
        model.addAttribute("nhaCungCap", new NhaCungCap());

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listNCC", nhaCungCapService.findAll(pageable));
        return "admin/nhacungcap-form";
    }

    @PostMapping("")
    public String handlePostNhaCungCap(NhaCungCap ncc, BindingResult bindingResult, Model model) {
        //sau nay get session object NhanVien o day
        NhanVien nv = sessionService.get("nhanVien");
        ncc.setNguoiThem(nv);
        nhaCungCapService.save(ncc);
        return "redirect:/admin/nha-cung-cap";
    }

    @GetMapping("/{id}")
    public String handleGetNhaCungCap(@PathVariable("id") String id, Model model, @RequestParam("p") Optional<Integer> p) {
        NhaCungCap ncc = nhaCungCapService.findById(id);
        if(ncc != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("nhaCungCap", ncc);
        }

        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listNCC", nhaCungCapService.findAll(pageable));
        return "admin/nhacungcap-form";
    }

    @GetMapping(value = "/delete", params = "id")
    public String handleDeleteNhaCungCap(@RequestParam("id") String id) {
        nhaCungCapService.deleteById(id);
        return "redirect:/admin/nha-cung-cap";
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/nha-cung-cap";
            }

            Pageable pageable = PageRequest.of(0, 5);
            Page<NhaCungCap> nhaCungCapPage = nhaCungCapService.findByKeyword(keyword.get(), pageable);
            if(nhaCungCapPage != null) {
                model.addAttribute("nhaCungCap", new NhaCungCap());
                model.addAttribute("listNCC", nhaCungCapPage);
                return "admin/nhacungcap-form";
            } else {
                return "redirect:/admin/nha-cung-cap";
            }
        } else {
            return "redirect:/admin/nha-cung-cap";
        }
    }
}
