package com.T2CBee.controller.admin;

import com.T2CBee.entity.ChiTietDanhMuc;
import com.T2CBee.entity.ChiTietMaGiamGia;
import com.T2CBee.entity.MaGiamGia;
import com.T2CBee.entity.SanPham;
import com.T2CBee.repository.ChiTietMaGiamGiaRepository;
import com.T2CBee.repository.MaGiamGiaRepository;
import com.T2CBee.service.NhanVienService;
import com.T2CBee.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/ma-giam-gia")
public class MaGiamGiaController {

    @Autowired
    NhanVienService nhanVienService;

    @Autowired
    MaGiamGiaRepository maGiamGiaRepository;

    @Autowired
    SanPhamService sanPhamService;

    @Autowired
    ChiTietMaGiamGiaRepository chiTietMaGiamGiaRepository;

    @GetMapping("")
    public String index(Model model, @RequestParam("p") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<MaGiamGia> listMGG = maGiamGiaRepository.findAll(pageable);
        model.addAttribute("maGiamGia", new MaGiamGia());
        model.addAttribute("listSP", sanPhamService.findAll());
        model.addAttribute("listMGG", listMGG);
        return "admin/voucher-form";
    }

    @GetMapping("{id}")
    public String getSanPham(Model model, @PathVariable("id") String id, @RequestParam("p") Optional<Integer> p) {
        model.addAttribute("maGiamGia", maGiamGiaRepository.findById(id).get());
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<MaGiamGia> listMGG = maGiamGiaRepository.findAll(pageable);
        model.addAttribute("listSP", sanPhamService.findAll());
        model.addAttribute("listMGG", listMGG);
        return "admin/voucher-form";
    }

    @PostMapping("")
    public String handlePost(MaGiamGia maGiamGia, Model model,
                             @RequestParam("chiTietMaGiamGias") Optional<String[]> chiTietMaGiamGias
    ) {
        //Lưu chi tiết giảm giá
        List<ChiTietMaGiamGia> listCTGG = new ArrayList<>();
        if(chiTietMaGiamGias.isPresent()) {
            for (String item : chiTietMaGiamGias.get()) {
                SanPham validSP = sanPhamService.findById(Integer.parseInt(item));
                if(validSP != null) {
                    ChiTietMaGiamGia existCTGG = chiTietMaGiamGiaRepository.findExistChiTietMaGiamGia(maGiamGia.getMaGiamGia(), validSP.getMaSanPham());
                    if(existCTGG == null) {
                        ChiTietMaGiamGia newCTMGG = new ChiTietMaGiamGia();
                        newCTMGG.setMaGiamGia(maGiamGia);
                        newCTMGG.setSanPham(validSP);
                        listCTGG.add(newCTMGG);
                    }
                }
            }
        } else {
            //Dành cho thêm mới: nếu user không chọn SP áp dụng thì sẽ chọn in ra lỗi console
            System.out.println("Vui lòng chọn ít nhất 1 sẢN phẨm");
            return "redirect:/admin/ma-giam-gia";
        }
        //Kết thúc lưu chi tiết giảm giá
        maGiamGia.setNguoiThem(nhanVienService.findById("NV01"));
        maGiamGiaRepository.save(maGiamGia);

        if(listCTGG != null) {
            for (ChiTietMaGiamGia item : listCTGG) {
                chiTietMaGiamGiaRepository.save(item);
            }
        }
        return "redirect:/admin/ma-giam-gia";
    }

    @GetMapping(value = "/delete" , params = {"ctgg", "mggid"})
    public String handleDeleteAllCTGG(@RequestParam("mggid") String mggid) {
        chiTietMaGiamGiaRepository.deleteAllMaGiamGiaBySanPhamID(mggid);
        return "redirect:/admin/ma-giam-gia/" + mggid;
    }

    @GetMapping(value = "/delete" , params = {"id"})
    public String handleDeleteMaGiamGia(@RequestParam("id") String magg) {
        maGiamGiaRepository.deleteById(magg);
        return "redirect:/admin/ma-giam-gia";
    }


}
