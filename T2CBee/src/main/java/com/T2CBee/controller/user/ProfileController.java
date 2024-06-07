package com.T2CBee.controller.user;

import com.T2CBee.entity.KhachHang;
import com.T2CBee.service.KhachHangServiceImpl;
import com.T2CBee.service.ProvinceService;
import com.T2CBee.service.SessionService;
import org.eclipse.tags.shaded.org.apache.xpath.objects.XString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.Optional;

@Controller
public class ProfileController {

    @Autowired
    SessionService session;
    @Autowired
    KhachHangServiceImpl khachHangServiceImplement;

    // Profile Page
    @GetMapping("/thong-tin")
    public String profile(Model model) {
        model.addAttribute("path", "page/profile/information");
        return "index";
    }

    @GetMapping("/don-hang-cua-toi")
    public String myorders(Model model) {
        model.addAttribute("path", "page/profile/myorders");
        return "index";
    }

    @GetMapping("/danh-sach-yeu-thich")
    public String wishlist(Model model) {
        model.addAttribute("path", "page/profile/wishlist");
        return "index";
    }

    @RequestMapping("/tai-khoan-chi-tiet")
    public String accountdetails(Model model) {
        model.addAttribute("path", "page/profile/accountdetails");


        KhachHang user = session.get("user");
        if (user != null) {
            model.addAttribute("name", user.getHoVaTen());
            model.addAttribute("birthday", user.getNgaySinh());
            model.addAttribute("email", user.getEmail());
        }

        return "index";
    }


    @PostMapping("/cap-nhat-thong-tin")
    public String updateinfo(Model model,
                             @RequestParam("name") String name,
                             @RequestParam("birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> birthday) {
        KhachHang user = session.get("user");
        user.setHoVaTen(name);
        if (birthday.isPresent()) {
            user.setNgaySinh(birthday.get());
        }
        khachHangServiceImplement.save(user);

        return "redirect:/tai-khoan-chi-tiet";
    }

    @PostMapping("/cap-nhat-email")
    public String updateemail(Model model,
                              @RequestParam("email") String email) {
        KhachHang user = session.get("user");
        user.setEmail(email);
        khachHangServiceImplement.save(user);

        return "redirect:/tai-khoan-chi-tiet";
    }

    @PostMapping("/cap-nhat-mat-khau")
    public String updatepassword(Model model,
                                 @RequestParam("pwOld") String pwOld,
                                 @RequestParam("pwNew") String pwNew,
                                 @RequestParam("pwRepeat") String pwRepeat) {
        KhachHang user = session.get("user");
        if (pwOld.equals(user.getPassword())) {
            if (pwNew.equals(pwRepeat)) {
                user.setPassword(pwNew);
                khachHangServiceImplement.save(user);
            } else model.addAttribute("error", "Mật khẩu không khớp!");


        } else model.addAttribute("error", "Mật khẩu cũ không đúng!");
        return "forward:/tai-khoan-chi-tiet";
    }


    @Autowired
    private ProvinceService provinceService;

    @GetMapping("/so-dia-chi")
    public String addressbook(Model model) {
        model.addAttribute("path", "page/profile/addressbook");
        KhachHang user = session.get("user");

        String fullAddress = user.getDiaChi();
        model.addAttribute("fullAddress", fullAddress);


        String city = null;
        String address = null;


        if (fullAddress != null) {


            String[] parts = fullAddress.split(" - ", 2);
            city = parts[0];

            if (parts.length > 1) {
                address = parts[1];
            }

        }


        model.addAttribute("name", user.getHoVaTen());
        model.addAttribute("city", city);
        model.addAttribute("address", address);
        model.addAttribute("numberphone", user.getSoDienThoai());

        model.addAttribute("provinces", provinceService.getProvinces());

//        System.out.println(user.getDiaChi());


        return "index";
    }


    @PostMapping("/so-dia-chi")
    public String addressbookpost(Model model,
                                  @RequestParam("city")String city,
                                  @RequestParam("address")String address) {

        String fullAddress = city + " - "+address;

        KhachHang user = session.get("user");
        user.setDiaChi(fullAddress);
        khachHangServiceImplement.save(user);

        return "redirect:/so-dia-chi";
    }

    @RequestMapping("/xoa-dia-chi")
    public String deleteaddress(Model model) {

        String fullAddress = null;

        KhachHang user = session.get("user");
        user.setDiaChi(fullAddress);
        khachHangServiceImplement.save(user);

        return "redirect:/so-dia-chi";
    }


}
