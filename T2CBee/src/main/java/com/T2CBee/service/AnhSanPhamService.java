package com.T2CBee.service;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.ChiTietDanhMuc;

import java.util.List;

public interface AnhSanPhamService {
    List<AnhSanPham> findAll();

    AnhSanPham findById(Integer id);

    AnhSanPham save(AnhSanPham emp);

    void deleteById(Integer id);

    AnhSanPham findExistAnhSanPham(String url, Integer maSanPham);

    void deleteAllAnhSanPhamBySanPhamID(Integer maSanPham);
}
