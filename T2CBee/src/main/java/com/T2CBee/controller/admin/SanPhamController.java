package com.T2CBee.controller.admin;

import com.T2CBee.entity.*;
import com.T2CBee.service.*;
import com.T2CBee.util.ImgBBUploader;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/san-pham")
public class SanPhamController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private PhieuNhapHangService phieuNhapHangService;

    @Autowired
    private ThuongHieuService thuongHieuService;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private ChiTietDanhMucService chiTietDanhMucService;

    @Autowired
    private AnhSanPhamService anhSanPhamService;
    @Autowired
    private SessionService sessionService;

    @GetMapping("")
    public String sanPham(Model model, @RequestParam("p") Optional<Integer> p) {
        //navigate trang
        Pageable pageable = PageRequest.of(p.orElse(0), 10);
        model.addAttribute("listSP", sanPhamService.findAll(pageable));
        return "admin/product";
    }

    @PostMapping("")
    public String handlePostSanPham(Model model, Optional<SanPham> sp,
                                    @RequestParam("danhMucs") Optional<String[]> danhMucs,
                                    @RequestParam("fileAnhs") Optional<List<MultipartFile>> files
    )  {
        NhanVien nv = sessionService.get("nhanVien");

        if(sp.isPresent()) {
            SanPham sanPham = sp.get();

            //xử lý thêm nhiều danh mục vào 1 sản phẩm
            List<ChiTietDanhMuc> listCTDM = new ArrayList<>();
            if(danhMucs.isPresent()) {
                //nếu user thay đổi danh mục của sp
                for (String item : danhMucs.get()) {
                    DanhMuc validDanhMuc = danhMucService.findById(Integer.parseInt(item));
                    if(validDanhMuc != null) {
                        //Kiểm tra logic nếu đã tồn tại chi tiết danh mục trc thì ko thêm
                        ChiTietDanhMuc existCTDM =  chiTietDanhMucService.findExistChiTietDanhMuc(validDanhMuc.getMaDanhMuc(), sp.get().getMaSanPham());
                        if(existCTDM == null) {
                            ChiTietDanhMuc newCTDM = new ChiTietDanhMuc();
                            newCTDM.setSanPham(sp.get());
                            newCTDM.setDanhMuc(validDanhMuc);
                            listCTDM.add(newCTDM);
                        }
                    } else {
                        throw new RuntimeException("Mã danh mục không tồn tại trong db");
                    }
                }
            } else if(sp.get().getMaSanPham() != 0) {
                //Dành cho update: nếu user không chọn danh mục mới thì sẽ dùng danh mục cũ để lưu
                SanPham existSP = sanPhamService.findById(sp.get().getMaSanPham());
                if(existSP != null) {
                    listCTDM = existSP.getDanhMucs();
                }
            } else {
                //Dành cho thêm mới: nếu user không chọn danh mục mới thì sẽ chọn "Nội Thất" làm mặc định
                System.out.println("Vui lòng chọn ít nhất 1 danh mục");
                return "redirect:/admin/san-pham";
            }
            sanPham.setDanhMucs(listCTDM);
            //kết thúc xử lý thêm nhiều danh mục vào 1 sản phẩm

            //xử lý thêm nhiều ảnh vào 1 sản phẩm
            List<AnhSanPham> listAnhSanPham = new ArrayList<>();
            if(files.isPresent()) {
                try {
                    for (MultipartFile file : files.get()) {
                        if (!file.isEmpty()) {
                            String url = ImgBBUploader.uploadImage(file.getBytes(),null);
                            //Kiểm tra logic trùng url đã có sẵn trong db thì ko thêm
                            AnhSanPham existAnh = anhSanPhamService.findExistAnhSanPham(url, sp.get().getMaSanPham());
                            if(existAnh == null) {
                                AnhSanPham imgs = new AnhSanPham();
                                imgs.setSanPham(sp.get());
                                imgs.setUrl(url);
                                listAnhSanPham.add(imgs);
                            }
                        }
                    }
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            } else if(sp.get().getMaSanPham() != 0) {
                List<AnhSanPham> existAnhSP = sanPhamService.findById(sp.get().getMaSanPham()).getAnhSanPhams();
                if(existAnhSP != null) {
                    listAnhSanPham = existAnhSP;
                }
            } else {
                System.out.println("loz");
            }
            sanPham.setAnhSanPhams(listAnhSanPham);
            sanPham.setNguoiThem(nv);
            //kết thúc xử lý thêm nhiều ảnh vào 1 sản phẩm


            //LƯU SẢN PHẨM VÀO DB
            sanPhamService.save(sp.get());
            //LƯU NHIỀU DANH MỤC VÀO DB
            if(listCTDM != null) {
                for (ChiTietDanhMuc item : listCTDM) {
                    chiTietDanhMucService.save(item);
                }
            }

            //LƯU NHIỀU ẢNH VÀO DB
            if(listAnhSanPham != null) {
                for (AnhSanPham item : listAnhSanPham) {
                    anhSanPhamService.save(item);
                }
            }


        } else {
            throw new RuntimeException("Sản phẩm không hợp lệ!");
        }
        return "redirect:/admin/san-pham";
    }

    @GetMapping("/them-moi")
    public String showInsertFormView(Model model) {
        SanPham sp = new SanPham();
        model.addAttribute("sanPham", sp);
        model.addAttribute("listDM", danhMucService.findAll());
        model.addAttribute("listTH", thuongHieuService.findAll());
        model.addAttribute("listPN", phieuNhapHangService.findAll());
        return "admin/product-form";
    }

    @GetMapping("/{id}")
    public String handleGetPhieuNhapHang(@PathVariable("id") Integer id, Model model) {
        SanPham sp = sanPhamService.findById(id);

        if(sp != null) {
            model.addAttribute("isUpdatePage", true);
            model.addAttribute("listDM", danhMucService.findAll());
            model.addAttribute("listTH", thuongHieuService.findAll());
            model.addAttribute("listPN", phieuNhapHangService.findAll());
            model.addAttribute("danhMucMessage", sp.getDanhMucs().toString());
        }
        model.addAttribute("sanPham", sp);
        return "admin/product-form";
    }

    //XÓA SẢN PHẨM
    @GetMapping(value = "/delete", params = "id")
    public String handleDeleteSanPham(@RequestParam("id") Integer spid) {
        sanPhamService.deleteById(spid);
        return "redirect:/admin/san-pham";
    }

    //XÓA TÂT CẢ DANH MỤC CỦA SẢN PHẨM
    @GetMapping(value = "/delete", params = {"ctdm", "spid"})
    public String handleDeleteAllCTDM(@RequestParam("ctdm") String ctdm, @RequestParam("spid") Integer spid, Model model) {
        chiTietDanhMucService.deleteAllChiTietDanhMucBySanPhamID(spid);
        model.addAttribute("danhMucMessage", "Xóa toàn bộ danh mục thành công");
        return "forward:/admin/san-pham/"+ spid;
    }

    //XÓA TÂT CẢ ẢNH CỦA SẢN PHẨM
    @GetMapping(value = "/delete", params = {"anh", "spid"})
    public String handleDeleteAllAnhSanPham(@RequestParam("anh") String anh, @RequestParam("spid") Integer spid, Model model) {
        anhSanPhamService.deleteAllAnhSanPhamBySanPhamID(spid);
        model.addAttribute("anhSanPhamMess", "Xóa toàn bộ ảnh sản phẩm thành công!");
        return "forward:/admin/san-pham/"+ spid;
    }

    @GetMapping("/tim-kiem")
    public String timKiem(Model model, @RequestParam("keyword") Optional<String> keyword) {
        if (keyword.isPresent()) { //keyword =! null
            if(keyword.get().isBlank()) {
                return "redirect:/admin/san-pham";
            }

            Pageable pageable = PageRequest.of(0, 10);
            Page<SanPham> SanPhamPage = sanPhamService.findByKeyword(keyword.get(), pageable);
            if(SanPhamPage != null) {
                model.addAttribute("listSP", SanPhamPage);
                return "admin/product";
            } else {
                return "redirect:/admin/san-pham";
            }
        } else {
            return "redirect:/admin/san-pham";
        }
    }
}
