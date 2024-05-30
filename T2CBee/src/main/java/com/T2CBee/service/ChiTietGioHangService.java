package com.T2CBee.service;

import com.T2CBee.entity.ChiTietGioHang;
import com.T2CBee.entity.ChiTietGioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChiTietGioHangService {
    List<ChiTietGioHang> findAll();

    ChiTietGioHang findById(Integer id);

    ChiTietGioHang save(ChiTietGioHang emp);

    void deleteById(Integer id);

    Page<ChiTietGioHang> findChiTietGioHangByGioHangId(Integer maGioHang, Pageable pageable);
}
