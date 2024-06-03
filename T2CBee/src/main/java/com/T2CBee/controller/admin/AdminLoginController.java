package com.T2CBee.controller.admin;

import com.T2CBee.entity.NhanVien;
import com.T2CBee.service.CookieService;
import com.T2CBee.service.NhanVienService;
import com.T2CBee.service.SessionService;
import jakarta.servlet.http.Cookie;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    private static final Logger logger = LoggerFactory.getLogger(NhanVienController.class);


    @Autowired
    NhanVienService nhanVienService;
    @Autowired
    private SessionService sessionService;
    @Autowired
    private CookieService cookieService;

    @GetMapping("/dang-nhap")
    public String getDangNhap(Model model) {
        NhanVien nv = new NhanVien();
        Cookie cookie = cookieService.get("maNhanVien");
        Cookie cookie2 = cookieService.get("matKhauNhanVien");
        if(cookie2 != null && cookie != null) {
            nv.setId(cookie.getValue());
            nv.setMatKhau(cookie2.getValue());
        }
        model.addAttribute("nhanVien", nv);
        return "admin/login";
    }

    @PostMapping("/dang-nhap")
    public String postDangNhap(NhanVien nhanVien, Model model,
                               @RequestParam(name = "remember", defaultValue = "false") Boolean isRememberAccount
    ) {
        NhanVien isExistNV = nhanVienService.findById(nhanVien.getId());

        if (isExistNV == null) {
            model.addAttribute("error", "Mã nhân viên không hợp lệ");
            return "admin/login";
        }

        if(!nhanVien.getMatKhau().trim().equals(isExistNV.getMatKhau().trim())) {
            System.out.println("Sai mật khẩu");
            model.addAttribute("error", "Sai mật khẩu");
            return "admin/login";
        }

        //lưu ghi nhớ đăng nhập bằng cookie
        if (isRememberAccount) {
            System.out.println("Đăng nhập thành công và lưu cookie");
            sessionService.set("nhanVien", isExistNV);
            cookieService.add("maNhanVien", isExistNV.getId(), 1);
            cookieService.add("matKhauNhanVien", isExistNV.getMatKhau().trim(), 1);
            return "redirect:/admin/trang-chu";
        } else {
            System.out.println("Đăng nhập thành công và ko lưu session");
            sessionService.set("nhanVien", isExistNV);
            cookieService.remove("maNhanVien");
            cookieService.remove("matKhauNhanVien");
            return "redirect:/admin/trang-chu";
        }
    }

    @GetMapping("/quen-mat-khau")
    public String quenMatKhau() {
        return "admin/forgot-password";
    }

    @GetMapping("/dang-xuat")
    public String dangXuat() {
        sessionService.remove("nhanVien");
        return "redirect:/admin/dang-nhap";
    }
}
