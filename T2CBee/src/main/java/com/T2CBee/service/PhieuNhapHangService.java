package com.T2CBee.service;

import com.T2CBee.entity.PhieuNhapHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PhieuNhapHangService {
    List<PhieuNhapHang> findAll();

    Page<PhieuNhapHang> findAll(Pageable pageable);

    PhieuNhapHang findById(String id);

    Page<PhieuNhapHang> findByKeyword(String keyword, Pageable pageable);

    PhieuNhapHang save(PhieuNhapHang emp);

    void deleteById(String id);
}
