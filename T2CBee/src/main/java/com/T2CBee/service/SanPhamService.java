package com.T2CBee.service;

import com.T2CBee.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface SanPhamService{
    List<SanPham> findAll();

    Page<SanPham> findAll(Pageable pageable);

    SanPham findById(Integer id);

    Page<SanPham> findByKeyword(String keyword, Pageable pageable);
    
    Page<SanPham> findByDanhMuc(String danhMuc, Pageable pageable);

    List<SanPham> findNewProducts();

    Page<SanPham> findByDanhMucAndGiaBetween(String danhMuc, double minPrice, double maxPrice, Pageable pageable);

    Page<SanPham> findByPriceBetween(double minPrice, double maxPrice, Pageable pageable);

    SanPham save(SanPham emp);

    void deleteById(Integer id);
}
