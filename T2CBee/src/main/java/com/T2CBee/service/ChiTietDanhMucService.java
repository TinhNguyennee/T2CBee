package com.T2CBee.service;

import com.T2CBee.entity.ChiTietDanhMuc;
import com.T2CBee.entity.DanhMuc;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ChiTietDanhMucService {
    List<ChiTietDanhMuc> findAll();

    List<DanhMuc> getAllDanhMucs();

    ChiTietDanhMuc findById(Integer id);

    ChiTietDanhMuc save(ChiTietDanhMuc emp);

    void deleteById(Integer id);

    ChiTietDanhMuc findExistChiTietDanhMuc(Integer maDanhMuc, Integer maSanPham);

    void deleteAllChiTietDanhMucBySanPhamID(Integer maSanPham);
}
