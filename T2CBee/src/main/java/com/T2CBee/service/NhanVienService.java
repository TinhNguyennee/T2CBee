package com.T2CBee.service;

import com.T2CBee.entity.NhaCungCap;
import com.T2CBee.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface NhanVienService {
    List<NhanVien> findAll();

    Page<NhanVien> findAll(Pageable pageable);

    NhanVien findById(String id);

    NhanVien save(NhanVien emp);

    void deleteById(String id);

    Page<NhanVien> findByKeyword(String keyword, Pageable pageable);
}
