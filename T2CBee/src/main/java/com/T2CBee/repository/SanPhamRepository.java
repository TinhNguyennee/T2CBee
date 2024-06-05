package com.T2CBee.repository;

import com.T2CBee.entity.SanPham;

import java.util.List;

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

        @Query("SELECT sp FROM SanPham sp ORDER BY sp.ngayTao DESC")
        List<SanPham> findNewProducts();

        @Query("SELECT sp FROM SanPham sp JOIN sp.danhMucs ctdm JOIN ctdm.danhMuc dm WHERE dm.tenDanhMuc = :danhMuc")
        Page<SanPham> findByDanhMuc(String danhMuc, Pageable pageable);

        @Query("SELECT sp FROM SanPham sp WHERE sp.giaBan BETWEEN :giaMin AND :giaMax")
        Page<SanPham> findByGiaBanBetween(double giaMin, double giaMax, Pageable pageable);

        @Query("SELECT sp FROM SanPham sp JOIN sp.danhMucs ctdm JOIN ctdm.danhMuc dm WHERE dm.tenDanhMuc = :danhMuc AND sp.giaBan BETWEEN :giaMin AND :giaMax")
        Page<SanPham> findByDanhMucAndGiaBanBetween(String danhMuc, double giaMin, double giaMax, Pageable pageable);

}
