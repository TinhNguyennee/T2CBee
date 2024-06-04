package com.T2CBee.service;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.BinhLuan;
import com.T2CBee.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface SanPhamService{
    List<SanPham> findAll();

    Page<SanPham> findAll(Pageable pageable);

    SanPham findById(Integer id);

    Page<SanPham> findByKeyword(String keyword, Pageable pageable);

    SanPham save(SanPham emp);

    void deleteById(Integer id);
    List<AnhSanPham> findAllPictureByGroupId(String groupId);

    Double findMinPriceByGroupId(String groupId);

    Double findMaxPriceByGroupId(String groupId);

    List<String> findDistinctPhanLoaiByGroupId(String groupId);

    Integer countTotalReviewsByGroupId(String groupId);

    List<BinhLuan> findAllBinhLuanByGroupId(String groupId);

    List<String> findDanhMucNamesByGroupId(String groupId);

    SanPham findSanPhamByPhanLoaiAndGroup(String groupId, Optional<String> productType);
}
