package com.T2CBee.service;

import com.T2CBee.entity.DanhMuc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface DanhMucService {
    List<DanhMuc> findAll();

    Page<DanhMuc> findAll(Pageable pageable);

    DanhMuc findById(Integer id);

    Page<DanhMuc> findByKeyword(String keyword, Pageable pageable);

    DanhMuc save(DanhMuc emp);

    void deleteById(Integer id);
}
