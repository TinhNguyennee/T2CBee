package com.T2CBee.service;

import com.T2CBee.entity.ChiTietDanhMuc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ChiTietDanhMucService {
    List<ChiTietDanhMuc> findAll();

    ChiTietDanhMuc findById(Integer id);

    ChiTietDanhMuc save(ChiTietDanhMuc emp);

    void deleteById(Integer id);

    ChiTietDanhMuc findExistChiTietDanhMuc(Integer maDanhMuc, Integer maSanPham);

    void deleteAllChiTietDanhMucBySanPhamID(Integer maSanPham);
}
