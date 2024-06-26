package com.T2CBee.controller.user;

import com.T2CBee.entity.*;
import com.T2CBee.repository.SanPhamRepository;
import com.T2CBee.repository.SanPhamYeuThichRepository;
import com.T2CBee.service.ChiTietDanhMucService;
import com.T2CBee.service.SanPhamService;
import com.T2CBee.service.SessionService;
import com.T2CBee.util.BreadcrumbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class ProductsController {
    @Autowired
    SanPhamService sanPhamService;

    @Autowired
    SessionService sessionService;

    @Autowired
    SessionService session;

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    SanPhamYeuThichRepository sanPhamYeuThichRepository;

    Page<SanPham> lstProducts;
    // Product Details
    @Autowired
    SanPhamService daoSanPham;
    @Autowired
    private ChiTietDanhMucService chiTietDanhMucService;
    List<Object> lstBreadcrumb = BreadcrumbUtil.createBreadcrumbList();
    // Product Details
    @GetMapping("/chi-tiet-san-pham/{id}")
    public String productDetails(Model model, @PathVariable(name = "id") Integer id,
                                 @RequestParam(name = "productType", required = false) Optional<String> productType) {
        SanPham sp = daoSanPham.findById(id);
        String group = sp.getGroupId().trim();
        List<AnhSanPham> lstPicture = daoSanPham.findAllPictureByGroupId(group);
        List<AnhSanPham> lstPictureSp = new ArrayList<>();
        lstPictureSp  = daoSanPham.findPictureBySanPhamId(id);
        List<Double> min_max_giaBan = new ArrayList<>();
        Double minPrice = daoSanPham.findMinPriceByGroupId(group);
        Double maxPrice = daoSanPham.findMaxPriceByGroupId(group);
        if (minPrice.equals(maxPrice)) {
            min_max_giaBan.add(minPrice);
        } else {
            min_max_giaBan.add(minPrice);
            min_max_giaBan.add(maxPrice);
        }
        List<String> chiTietLoai = daoSanPham.findDistinctPhanLoaiByGroupId(group);
        int soDanhGia = daoSanPham.countTotalReviewsByGroupId(group);

        if (productType.isPresent()) {
            sp = daoSanPham.findSanPhamByPhanLoaiAndGroup(group, productType);
            lstPictureSp = daoSanPham.findPictureBySanPhamId(sp.getMaSanPham());
        }
        List<BinhLuan> lstBinhLuan = daoSanPham.findAllBinhLuanByGroupId(group);
        List<String> lstDanhMuc = daoSanPham.findDanhMucNamesByGroupId(group);
        model.addAttribute("soDanhGia", soDanhGia);
        model.addAttribute("soSao", daoSanPham.findAverageRatingByGroupId(group));
        model.addAttribute("chiTietLoai", chiTietLoai);
        model.addAttribute("min_max_giaBan", min_max_giaBan);
        model.addAttribute("sp", sp);
        model.addAttribute("lstDanhMuc", lstDanhMuc);
        model.addAttribute("imgs", lstPicture);
        model.addAttribute("main_imgs", lstPictureSp);
        model.addAttribute("cmts", lstBinhLuan);
        model.addAttribute("path", "page/product-details");
        // Breadcumb
        lstBreadcrumb.removeAll(lstBreadcrumb);
        BreadcrumbUtil.addBreadcrumb("Danh sách sản phẩm", "/danh-sach-san-pham/Tất Cả", lstBreadcrumb);
        BreadcrumbUtil.addBreadcrumb(sp.getTenSanPham(), "", lstBreadcrumb);
        model.addAttribute("breadcrumb", lstBreadcrumb);


        boolean fillHeart = false;

        KhachHang user = session.get("user");

        if(user == null){
            model.addAttribute("fillHeart", fillHeart);
        }else{


            SanPhamYeuThich sanPhamYeuThich = sanPhamYeuThichRepository.findByKhachHangEqualsAndSanPhamEquals(user,sanPhamRepository.findById(id));

            if(sanPhamYeuThich != null)fillHeart = true;

            model.addAttribute("fillHeart", fillHeart);
        }



        return "index";
    }


    @GetMapping("/danh-sach-san-pham/{danh-muc}")
    public String danhMucSort(
            @RequestParam("p") Optional<Integer> p,
            @PathVariable("danh-muc") String danhMuc,
            @RequestParam("sort") Optional<String> sort,
            Model model) {

        int currentPage = p.orElse(0);
        int pageSize = 9;
        Sort sortDirection = Sort.unsorted();

        if (sort.isPresent()) {
            String sortParam = sort.get();
            if (sortParam.contains("az")) {
                sortDirection = Sort.by("tenSanPham").ascending();
            } else if (sortParam.contains("za")) {
                sortDirection = Sort.by("tenSanPham").descending();
            } else if (sortParam.contains("priceAsc")) {
                sortDirection = Sort.by("giaBan").ascending();
            } else if (sortParam.contains("priceDesc")) {
                sortDirection = Sort.by("giaBan").descending();
            } else if (sortParam.contains("newest")) {
                sortDirection = Sort.by("ngayTao").descending();
            } else if (sortParam.contains("oldest")) {
                sortDirection = Sort.by("ngayTao").ascending();
            }
        }

        Pageable pageable = PageRequest.of(currentPage, pageSize, sortDirection);
        Page<SanPham> lstProducts;

        Double minPrice = (Double) sessionService.get("minPrice");
        Double maxPrice = (Double) sessionService.get("maxPrice");

        if (minPrice == null || maxPrice == null) {
            minPrice = 0.0;
            maxPrice = 5000000.0;
            sessionService.set("minPrice", minPrice);
            sessionService.set("maxPrice", maxPrice);
        }

        if (danhMuc.equalsIgnoreCase("Tất Cả")) {
            lstProducts = sanPhamService.findByPriceBetween(minPrice, maxPrice, pageable);
        } else {
            lstProducts = sanPhamService.findByDanhMucAndGiaBetween(danhMuc, minPrice, maxPrice, pageable);
        }

        Map<String, Integer> danhMucCounts = new HashMap<>();
        List<DanhMuc> danhMucs = chiTietDanhMucService.getAllDanhMucs();
        for (DanhMuc dm : danhMucs) {
            int count = sanPhamService.countByDanhMuc(dm.getTenDanhMuc());
            danhMucCounts.put(dm.getTenDanhMuc(), count);
        }
        model.addAttribute("danhMucCounts", danhMucCounts);
        model.addAttribute("allCounts", sanPhamService.countAllSanPham());
        model.addAttribute("sort", sort.orElse(""));
        model.addAttribute("pageNumber", currentPage);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        model.addAttribute("danhMuc", danhMuc);
        model.addAttribute("page", lstProducts);
        model.addAttribute("listDanhMuc", chiTietDanhMucService.getAllDanhMucs());
        model.addAttribute("path", "page/list-product");

        return "index";
    }

    @PostMapping("/danh-sach-san-pham/{danh-muc}")
    public String post(
            @RequestParam("min") Optional<Double> min,
            @RequestParam("max") Optional<Double> max,
            @RequestParam("p") Optional<Integer> p,
            @PathVariable("danh-muc") String danhMuc,
            @RequestParam("sort") Optional<String> sort,
            Model model) {

        double minPrice = min.orElse(Double.MIN_VALUE);
        double maxPrice = max.orElse(Double.MAX_VALUE);
        sessionService.set("minPrice", minPrice);
        sessionService.set("maxPrice", maxPrice);

        return danhMucSort(p, danhMuc, sort, model);
    }

}
