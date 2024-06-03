package com.T2CBee.repository;

import com.T2CBee.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
    @Query("SELECT e FROM KhachHang e WHERE " +
            "e.hoVaTen LIKE %:keyword% " +
            "OR e.email LIKE %:keyword% " +
            "OR e.soDienThoai LIKE %:keyword% ")
    Page<KhachHang> findByKeyword(@Param("keyword") String keyword, Pageable pageable);
    
    KhachHang findBySoDienThoaiEquals(String sodienthoai);
}
