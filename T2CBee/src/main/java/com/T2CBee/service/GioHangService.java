package com.T2CBee.service;

import com.T2CBee.entity.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface GioHangService {
    List<GioHang> findAll();

    Page<GioHang> findAll(Pageable pageable);

    GioHang findById(Integer id);

    Page<GioHang> findByKeyword(String keyword, Pageable pageable);

    GioHang save(GioHang emp);

    void deleteById(Integer id);

    List<GioHang> findByTrangThai(String trangThai);

    Page<GioHang> findByTrangThai(String trangThai, Pageable pageable);
}
