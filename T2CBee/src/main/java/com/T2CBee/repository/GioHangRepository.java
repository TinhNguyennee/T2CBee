package com.T2CBee.repository;

import com.T2CBee.entity.GioHang;
import com.T2CBee.entity.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface GioHangRepository extends JpaRepository<GioHang, Integer> {
    @Query("SELECT e FROM GioHang e WHERE e.trangThai = :status")
    List<GioHang> findByTrangThai(@Param("status") String status);

    @Query("SELECT e FROM GioHang e WHERE e.trangThai = :status")
    Page<GioHang> findByTrangThai(@Param("status") String status, Pageable pageable);

    @Query("SELECT e FROM GioHang e WHERE " +
            "e.khachHang.soDienThoai LIKE %:keyword% " +
            "OR e.khachHang.email LIKE %:keyword% " +
            "OR e.khachHang.hoVaTen LIKE %:keyword%")
    Page<GioHang> findByKeyword(@Param("keyword") String keyword, Pageable pageable);
}
