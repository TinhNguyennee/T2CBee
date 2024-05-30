package com.T2CBee.service;

import com.T2CBee.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface KhachHangService {
    List<KhachHang> findAll();

    Page<KhachHang> findAll(Pageable pageable);

    KhachHang findById(Integer id);

    Page<KhachHang> findByKeyword(String keyword, Pageable pageable);

    KhachHang save(KhachHang emp);

    void deleteById(Integer id);
}
