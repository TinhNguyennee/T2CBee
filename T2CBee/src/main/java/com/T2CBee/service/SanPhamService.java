package com.T2CBee.service;

import com.T2CBee.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface SanPhamService{
    List<SanPham> findAll();

    Page<SanPham> findAll(Pageable pageable);

    SanPham findById(Integer id);

    Page<SanPham> findByKeyword(String keyword, Pageable pageable);

    SanPham save(SanPham emp);

    void deleteById(Integer id);
}
