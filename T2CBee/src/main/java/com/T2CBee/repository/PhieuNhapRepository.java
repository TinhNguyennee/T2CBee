package com.T2CBee.repository;

import com.T2CBee.entity.KhachHang;
import com.T2CBee.entity.PhieuNhapHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PhieuNhapRepository extends JpaRepository<PhieuNhapHang, String> {
    @Query("SELECT e FROM PhieuNhapHang e WHERE " +
            "e.maPhieuNhap LIKE %:keyword% " +
            "OR e.nhaCungCap.maNhaCungCap LIKE %:keyword% " +
            "OR e.nhaCungCap.tenNhaCungCap LIKE %:keyword% " +
            "OR e.trangThai LIKE %:keyword% ")
    Page<PhieuNhapHang> findByKeyword(@Param("keyword") String keyword, Pageable pageable);
}
