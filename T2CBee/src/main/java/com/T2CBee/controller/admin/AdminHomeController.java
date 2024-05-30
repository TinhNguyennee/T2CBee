package com.T2CBee.controller.admin;

import com.T2CBee.entity.BinhLuan;
import com.T2CBee.repository.GioHangRepository;
import com.T2CBee.service.BinhLuanService;
import com.T2CBee.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private BinhLuanService binhLuanService;

    @GetMapping("/trang-chu")
    public String home(Model model, @RequestParam("p") Optional<Integer> p) {
        //dashboard
        model.addAttribute("countDHCXL", gioHangService.findByTrangThai("DANG_CHO").size());
        model.addAttribute("countDHDXL", gioHangService.findByTrangThai("DANG_GIAO_HANG").size());
        model.addAttribute("countDHHT", gioHangService.findByTrangThai("HOAN_THANH").size());
        model.addAttribute("countDHH", gioHangService.findByTrangThai("HUY").size());
        //bình luận
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listBL", binhLuanService.findAll(pageable));
        return "admin/index";
    }

    @GetMapping(value = "/binh-luan/delete", params = "id")
    public String deleteBinhLuan(@RequestParam("id") int id, Model model) {
        binhLuanService.deleteById(id);
        return "redirect:/admin/trang-chu";
    }

    @GetMapping(value = "/trang-chu/binh-luan", params = "tt")
    public String getBinhLuanByFillter (@RequestParam("tt") String tt, Model model, @RequestParam("p") Optional<Integer> p) {
        //dashboard
        model.addAttribute("countDHCXL", gioHangService.findByTrangThai("DANG_CHO").size());
        model.addAttribute("countDHDXL", gioHangService.findByTrangThai("DANG_GIAO_HANG").size());
        model.addAttribute("countDHHT", gioHangService.findByTrangThai("HOAN_THANH").size());
        model.addAttribute("countDHH", gioHangService.findByTrangThai("HUY").size());
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        //Binh luan
        if (tt.equals("1")) {
            model.addAttribute("listBL", binhLuanService.findByRating((short) 1, pageable));
        } else if (tt.equals("2")) {
            model.addAttribute("listBL", binhLuanService.findByRating((short) 2, pageable));
        } else if (tt.equals("3")) {
            model.addAttribute("listBL", binhLuanService.findByRating((short) 3, pageable));
        } else if (tt.equals("4")) {
            model.addAttribute("listBL", binhLuanService.findByRating((short) 4, pageable));
        } else if (tt.equals("5")) {
            model.addAttribute("listBL", binhLuanService.findByRating((short) 5, pageable));
        } else if (tt.equals("oldest")) {
            Sort sort = Sort.by("ngayBinhLuan").ascending();
            pageable = PageRequest.of(p.orElse(0), 5, sort);
            model.addAttribute("listBL", binhLuanService.findAll(pageable));
        } else if (tt.equals("lasted")) {
            Sort sort = Sort.by("ngayBinhLuan").descending();
            pageable = PageRequest.of(p.orElse(0), 5, sort);
            model.addAttribute("listBL", binhLuanService.findAll(pageable));
        } else if (tt.equals("reported")) {
            model.addAttribute("listBL", binhLuanService.findRepotedComment(pageable));
        }  else {
            model.addAttribute("listBL", binhLuanService.findAll(pageable));
        }

        return "admin/index";
    }

    @GetMapping(value = "/binh-luan/tim-kiem", params = "keyword")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/trang-chu";
            }
            Pageable pageable = PageRequest.of(0, 5);
            Page<BinhLuan> BinhLuanPage = binhLuanService.findByKeyword(keyword.get(), pageable);
            if(BinhLuanPage != null) {
                model.addAttribute("listBL", BinhLuanPage);
                return "admin/index";
            } else {
                return "redirect:/admin/trang-chu";
            }
        } else {
            return "redirect:/admin/trang-chu";
        }
    }
}
