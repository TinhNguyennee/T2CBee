package com.T2CBee.service;

import com.T2CBee.entity.NhaCungCap;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NhaCungCapService {
    List<NhaCungCap> findAll();

    Page<NhaCungCap> findAll(Pageable pageable);

    NhaCungCap findById(String id);

    Page<NhaCungCap> findByKeyword(String keyword, Pageable pageable);

    NhaCungCap save(NhaCungCap emp);

    void deleteById(String id);
}
