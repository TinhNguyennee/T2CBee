package com.T2CBee.repository;

import com.T2CBee.entity.ChiTietDanhMuc;
import com.T2CBee.entity.DanhMuc;

import jakarta.transaction.Transactional;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ChiTietDanhMucRepository extends JpaRepository<ChiTietDanhMuc, Integer> {
    @Query("SELECT e FROM ChiTietDanhMuc e WHERE e.danhMuc.maDanhMuc = :dm and e.sanPham.maSanPham = :masp")
    ChiTietDanhMuc findExistChiTietDanhMuc(@Param("dm") Integer dm, @Param("masp") Integer masp);

    @Transactional
    @Modifying
    @Query("DELETE FROM ChiTietDanhMuc e where e.sanPham.maSanPham = :masp")
    void deleteAllChiTietDanhMucBySanPhamID(@Param("masp") Integer masp);

    @Query("SELECT DISTINCT e.danhMuc FROM ChiTietDanhMuc e")
    List<DanhMuc> findAllDanhMucs();
}
