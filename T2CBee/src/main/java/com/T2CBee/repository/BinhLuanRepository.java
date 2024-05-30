package com.T2CBee.repository;

import com.T2CBee.entity.BinhLuan;
import com.T2CBee.entity.BinhLuan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BinhLuanRepository extends JpaRepository<BinhLuan, Integer> {
    @Query("SELECT e FROM BinhLuan e WHERE " +
            "e.binhLuan LIKE %:keyword% " +
            "OR e.sanPham.tenSanPham LIKE %:keyword% " +
            "OR e.nguoiBinhLuan.hoVaTen LIKE %:keyword% " +
            "OR e.nguoiBinhLuan.soDienThoai LIKE %:keyword% " +
            "OR e.nguoiBinhLuan.email LIKE %:keyword% ")
    Page<BinhLuan> findByKeyword(@Param("keyword") String keyword, Pageable pageable);

    @Query("SELECT e FROM BinhLuan e WHERE e.danhGia = :rating")
    Page<BinhLuan> findByRating(Short rating, Pageable pageable);

    @Query("SELECT e FROM BinhLuan e WHERE e.baoCaoSaiPham= true")
    Page<BinhLuan> findRepotedComment(Pageable pageable);

}
