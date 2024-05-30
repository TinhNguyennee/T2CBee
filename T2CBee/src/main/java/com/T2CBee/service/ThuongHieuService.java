package com.T2CBee.service;

import com.T2CBee.entity.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ThuongHieuService {
    List<ThuongHieu> findAll();

    Page<ThuongHieu> findAll(Pageable pageable);

    ThuongHieu findById(String id);

    ThuongHieu save(ThuongHieu emp);

    void deleteById(String id);

    Page<ThuongHieu> findByKeyword(String keyword, Pageable pageable);
}
