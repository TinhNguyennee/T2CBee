package com.T2CBee.repository;

import com.T2CBee.entity.ChiTietGioHang;
import com.T2CBee.entity.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChiTietGioHangRepository extends JpaRepository<ChiTietGioHang, Integer> {
    @Query("SELECT e FROM ChiTietGioHang e WHERE e.gioHang.id = :id")
    Page<ChiTietGioHang> findChiTietGioHangByGioHangId(@Param("id") Integer id, Pageable pageable);

    List<ChiTietGioHang> findByGioHangEquals(GioHang gioHang);
}
