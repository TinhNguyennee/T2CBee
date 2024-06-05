package com.T2CBee.controller.admin;

import com.T2CBee.entity.GoogleUserInfo;
import com.T2CBee.entity.MailInfo;
import com.T2CBee.entity.NhanVien;
import com.T2CBee.entity.ResetAdminPasswordToken;
import com.T2CBee.service.CookieService;
import com.T2CBee.service.MailerService;
import com.T2CBee.service.NhanVienService;
import com.T2CBee.service.SessionService;
import com.T2CBee.util.GoogleLoginUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;
import java.util.UUID;

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
    @Autowired
    private MailerService mailerService;
    @Autowired
    private ServletContext servletContext;

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
            model.addAttribute("error", "Sai mật khẩu");
            return "admin/login";
        }

        //lưu ghi nhớ đăng nhập bằng cookie
        if (isRememberAccount) {
            sessionService.set("nhanVien", isExistNV);
            cookieService.add("maNhanVien", isExistNV.getId(), 1);
            cookieService.add("matKhauNhanVien", isExistNV.getMatKhau().trim(), 1);
            return "redirect:/admin/trang-chu";
        } else {
            sessionService.set("nhanVien", isExistNV);
            cookieService.remove("maNhanVien");
            cookieService.remove("matKhauNhanVien");
            return "redirect:/admin/trang-chu";
        }
    }

    @GetMapping("/quen-mat-khau")
    public String handleGetQuenMatKhau() {
        return "admin/forgot-password";
    }

    @PostMapping("/quen-mat-khau")
    public String handlePostQuenMatKhau(@RequestParam("email") Optional<String> email, Model model, HttpServletRequest request) {
        if(email.isPresent()) {
            if(email.get().isBlank()) {
                model.addAttribute("alertCssClass", "alert-danger");
                model.addAttribute("message", "Vui lòng nhập email!");
                return "admin/forgot-password";
            }
            NhanVien nv = nhanVienService.findByEmail(email.get());
            if(nv != null) {
                //generate ra code confirm
                String token = UUID.randomUUID().toString();
                ResetAdminPasswordToken sendToken = new ResetAdminPasswordToken(token, nv);
                String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/admin/quen-mat-khau?id=" + token;
                sessionService.set("resetPassword", sendToken);
                try {
                    MailInfo mi = new MailInfo();
                    mi.setFrom("huanlcps28692@fpt.edu.vn");
                    mi.setTo(email.get());
                    mi.setSubject("T2CBee - YÊU CẦU XÁC NHẬN LẤY LẠI MẬT KHẨU");
                    mi.setBody(getResetEmailForm(nv.getHoTen(), "https://i.ibb.co/pX7gZMJ/logo.png", url));
                    mailerService.send(mi);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            model.addAttribute("alertCssClass", "alert-success");
            model.addAttribute("message", "Đã gửi email xác nhận!");

        }
        return "admin/forgot-password";
    }

    @GetMapping(value = "/quen-mat-khau" , params = "id")
    public String handleGetQuenMatKhau(@RequestParam("id") Optional<String> id) {
        if(id.isPresent()) {
            ResetAdminPasswordToken verifyToken = sessionService.get("resetPassword");
            if(id.get().equals(verifyToken.getId())) {
                return "admin/change-password";
            }
        }
        return "admin/forgot-password";
    }

    @PostMapping("/thay-doi-mat-khau")
    public String handlePostThayDoiMatKhau(@RequestParam("matKhau") Optional<String> matKhau,
                                           @RequestParam("nhapLaiMatKhau") Optional<String> nhapLaiMatKhau,
                                           Model model
    ) {
        ResetAdminPasswordToken token = sessionService.get("resetPassword");
        if(matKhau.isPresent() && nhapLaiMatKhau.isPresent()) {
            if(matKhau.get().isBlank() || nhapLaiMatKhau.get().isBlank()) {
                model.addAttribute("alertCssClass", "alert-danger");
                model.addAttribute("message", "Vui lòng nhập đầy đủ mật khẩu!");
            }

            if(matKhau.get().equals(nhapLaiMatKhau.get())) {
                NhanVien nhanVien = nhanVienService.findById(token.getNhanVien().getId());
                if(nhanVien != null) {
                    nhanVien.setMatKhau(nhapLaiMatKhau.get());
                    nhanVienService.save(nhanVien);
                    model.addAttribute("alertCssClass", "alert-success");
                    model.addAttribute("message", "Thay đổi mật khẩu thành công!");
                    sessionService.remove("resetPassword");
                }

            } else {
                model.addAttribute("alertCssClass", "alert-danger");
                model.addAttribute("message", "Mật khẩu và xác nhận mật khẩu phải trùng!");
            }
        } else {
            model.addAttribute("alertCssClass", "alert-danger");
            model.addAttribute("message", "Vui lòng nhập đầy đủ mật khẩu!");
        }

        return "admin/change-password";
    }

    @GetMapping("/dang-xuat")
    public String dangXuat() {
        sessionService.remove("nhanVien");
        return "redirect:/admin/dang-nhap";
    }

    @GetMapping("/dm")
    public String t() {
        sessionService.remove("nhanVien");
        sessionService.remove("resetPwCookie");
        return "redirect:/admin/dang-nhap";
    }

    //Google Login
    @Value("${google.client.id}")
    private String clientGoogletId;

    @Value("${google.client.secret}")
    private String clientGoogleSecret;

    @Value("${google.redirect.uri}")
    private String redirectGoogleUri;


    @GetMapping("dang-nhap/google")
    public String google(@RequestParam("code") String code, Model model) {
        boolean validAccess = isValidAccessGoogle(code);
        if(validAccess) {
            return "redirect:/admin/trang-chu";
        }
        return "redirect:/admin/dang-nhap";
    }

    @GetMapping(value = "/dang-nhap/google", params = "error")
    public String handleGoogle() {
        return "redirect:/admin/dang-nhap";
    }

    public boolean isValidAccessGoogle(String code) {
        // Bước 1: Lấy access token
        String accessToken = GoogleLoginUtil.getAccessToken(code, clientGoogletId, clientGoogleSecret, redirectGoogleUri);
        // Bước 2: Lấy thông tin người dùng
        String userInfoJson = GoogleLoginUtil.getUserInfo(accessToken);
        GoogleUserInfo userInfo = null;
        try {
            userInfo = new ObjectMapper().readValue(userInfoJson , GoogleUserInfo.class);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Bước 3: Kiểm tra Email có trong hệ thống
        if(userInfo != null) {
            NhanVien nv = nhanVienService.findByEmail(userInfo.getEmail());
            if(nv != null) {
                sessionService.set("nhanVien", nv);
                return true;
            }
        }
        return false;
    }

    public String getResetEmailForm(String tenNhanVien, String urlLogo, String urlResetPassword) {
        return ("<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"none\"\n" +
                "  style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "  <tr>\n" +
                "    <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:560px\">\n" +
                "      <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\"\n" +
                "        style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "        <tr>\n" +
                "          <td align=\"center\" style=\"padding:0;Margin:0;padding-top:10px;padding-bottom:10px;font-size:0px\"><img\n" +
                "              src=\""+ urlLogo +"\"\n" +
                "              alt style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\"\n" +
                "              width=\"100\"></td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "          <td align=\"center\" class=\"es-m-txt-c\" style=\"padding:0;Margin:0;padding-bottom:10px\">\n" +
                "            <h1\n" +
                "              style=\"Margin:0;line-height:46px;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:46px;font-style:normal;font-weight:bold;color:#333333\">\n" +
                "              Xác nhận đổi mật khẩu</h1>\n" +
                "          </td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "          <td align=\"center\" class=\"es-m-p0r es-m-p0l\"\n" +
                "            style=\"Margin:0;padding-top:5px;padding-bottom:5px;padding-left:40px;padding-right:40px\">\n" +
                "            <p\n" +
                "              style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;color:#333333;font-size:14px\">\n" +
                "              Xin chào "+ tenNhanVien +", Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu T2CBee của\n" +
                "              bạn</p>\n" +
                "          </td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "          <td align=\"center\" style=\"padding:0;Margin:0;padding-bottom:5px;padding-top:10px\">\n" +
                "            <p\n" +
                "              style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;color:#333333;font-size:14px\">\n" +
                "              Nếu không phải bạn, hãy bỏ qua email này</p>\n" +
                "          </td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "          <td align=\"center\" style=\"padding:0;Margin:0;padding-top:10px;padding-bottom:10px\"><span\n" +
                "              class=\"es-button-border\"\n" +
                "              style=\"border-style:solid;border-color:#2CB543;background:#5C68E2;border-width:0px;display:inline-block;border-radius:6px;width:auto\"><a\n" +
                "                href=\""+urlResetPassword+"\" class=\"es-button\" target=\"_blank\"\n" +
                "                style=\"mso-style-priority:100 !important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#FFFFFF;font-size:20px;padding:10px 30px 10px 30px;display:inline-block;background:#5C68E2;border-radius:6px;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-weight:normal;font-style:normal;line-height:24px;width:auto;text-align:center;mso-padding-alt:0;mso-border-alt:10px solid #5C68E2;padding-left:30px;padding-right:30px\">Đổi\n" +
                "                Mật Khẩu</a></span></td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "          <td align=\"center\" class=\"es-m-p0r es-m-p0l\"\n" +
                "            style=\"Margin:0;padding-top:5px;padding-bottom:5px;padding-left:40px;padding-right:40px\">\n" +
                "            <p\n" +
                "              style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;color:#333333;font-size:14px\">\n" +
                "              Sau khi xác nhận, chúng tôi sẽ thay đổi mật khẩu cho bạn</p>\n" +
                "          </td>\n" +
                "        </tr>\n" +
                "      </table>\n" +
                "    </td>\n" +
                "  </tr>\n" +
                "</table>");
    }
}
