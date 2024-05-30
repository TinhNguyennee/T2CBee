package com.T2CBee.service;

import com.T2CBee.entity.ChiTietMaGiamGia;

import java.util.List;

public interface ChiTIetMaGiamGiaService {
    List<ChiTietMaGiamGia> findAll();

    ChiTietMaGiamGia findById(Integer id);

    ChiTietMaGiamGia save(ChiTietMaGiamGia emp);

    void deleteById(Integer id);

    ChiTietMaGiamGia findExistChiTietMaGiamGia(String maGiamGia, Integer maSanPham);

}
