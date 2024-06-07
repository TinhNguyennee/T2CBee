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

import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private BinhLuanService binhLuanService;

    public List<Double> getDoanhThuByTrangThaiAndYear(String trangThai, int year) {
        // Lấy kết quả từ truy vấn JPQL
        List<Object[]> doanhThuTheoThang = gioHangService.countDoanhThuByTrangThaiAndYear(trangThai, year);

        // Khởi tạo danh sách để chứa doanh thu cho 12 tháng, với giá trị mặc định là 0
        List<Double> doanhThuHangThang = new ArrayList<>(Collections.nCopies(12, 0.0));

        // Điền dữ liệu doanh thu từ kết quả truy vấn vào danh sách
        for (Object[] row : doanhThuTheoThang) {
            if (row.length < 2) {
                // In ra console hoặc log nếu có vấn đề với kết quả truy vấn
                System.err.println("Kết quả truy vấn không đúng: " + Arrays.toString(row));
                continue;
            }

            int month = ((Number) row[0]).intValue();  // Cast and get the month (giá trị từ 1 đến 12)
            Double doanhThu = (Double) row[1];  // Get the revenue
            doanhThuHangThang.set(month - 1, doanhThu);  // Điền dữ liệu vào danh sách (lưu ý tháng bắt đầu từ 1)
        }

        return doanhThuHangThang;
    }


    @GetMapping("")
    public String admin() {
        return "redirect:/admin/trang-chu";
    }

    @GetMapping({"/trang-chu", "/binh-luan"})
    public String home(Model model, @RequestParam("p") Optional<Integer> p) {
        //dashboard
        model.addAttribute("countDHCXL", gioHangService.findByTrangThai("DANG_CHO").size());
        model.addAttribute("countDHDXL", gioHangService.findByTrangThai("DANG_GIAO_HANG").size());
        model.addAttribute("countDHHT", gioHangService.findByTrangThai("HOAN_THANH").size());
        model.addAttribute("countDHH", gioHangService.findByTrangThai("HUY").size());
        Double doanhThuDuKien = gioHangService.countDoanhThuByTrangThai("DANG_CHO") + gioHangService.countDoanhThuByTrangThai("DANG_GIAO_HANG");
        model.addAttribute("doanhThuDuKien", doanhThuDuKien);
        model.addAttribute("doanhThuHienTai", gioHangService.countDoanhThuByTrangThai("HOAN_THANH"));
        //bình luận
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("listBL", binhLuanService.findAll(pageable));
        //chart
        List<Double> doanhThuHangThang = getDoanhThuByTrangThaiAndYear("HOAN_THANH", 2024);
        model.addAttribute("chartValue", doanhThuHangThang);
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
        Double doanhThuDuKien = gioHangService.countDoanhThuByTrangThai("DANG_CHO") + gioHangService.countDoanhThuByTrangThai("DANG_GIAO_HANG");
        model.addAttribute("doanhThuDuKien", doanhThuDuKien);
        model.addAttribute("doanhThuHienTai", gioHangService.countDoanhThuByTrangThai("HOAN_THANH"));
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

        //chart
        List<Double> doanhThuHangThang = getDoanhThuByTrangThaiAndYear("HOAN_THANH", 2024);
        model.addAttribute("chartValue", doanhThuHangThang);
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
