package com.T2CBee.service;

import com.T2CBee.entity.BinhLuan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface BinhLuanService {
    List<BinhLuan> findAll();

    Page<BinhLuan> findAll(Pageable pageable);

    BinhLuan findById(Integer id);

    Page<BinhLuan> findByKeyword(String keyword, Pageable pageable);

    BinhLuan save(BinhLuan emp);

    void deleteById(Integer id);

    Page<BinhLuan> findRepotedComment(Pageable pageable);

    Page<BinhLuan> findByRating(Short rating, Pageable pageable);
}
