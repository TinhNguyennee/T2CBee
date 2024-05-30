package com.T2CBee.repository;

import com.T2CBee.entity.SanPham;
import com.T2CBee.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    @Query("SELECT e FROM SanPham e WHERE " +
            "e.tenSanPham LIKE %:keyword% " +
            "OR e.groupId LIKE %:keyword% " +
            "OR e.thuongHieu.tenThuongHieu LIKE %:keyword% " +
            "OR e.phanLoai LIKE %:keyword% ")
    Page<SanPham> findByKeyword(@Param("keyword") String keyword, Pageable pageable);
}
