package com.T2CBee.repository;

import com.T2CBee.entity.NhaCungCap;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NhaCungCapRepository extends JpaRepository<NhaCungCap, String> {
    @Query("SELECT e FROM NhaCungCap e WHERE " +
            "e.maNhaCungCap LIKE %:keyword% " +
            "OR e.tenNhaCungCap LIKE %:keyword% " +
            "OR e.maSoThue LIKE %:keyword% " +
            "OR e.soDienThoai LIKE %:keyword% " +
            "OR e.nguoiThem.id LIKE %:keyword%")
    Page<NhaCungCap> findByKeyword(@Param("keyword") String keyword, Pageable pageable);


}
