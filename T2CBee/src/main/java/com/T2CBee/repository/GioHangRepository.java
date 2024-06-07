package com.T2CBee.repository;

import com.T2CBee.entity.GioHang;
import com.T2CBee.entity.KhachHang;
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

    //Thống kê doanh thu
//    @Query("SELECT SUM((ctgh.sanPham.giaBan * ctgh.soLuong) - (ctgh.sanPham.giaBan * ctgh.soLuong)*mgg.discount) FROM ChiTietGioHang ctgh JOIN ctgh.gioHang gh JOIN ctgh.maGiamGia mgg WHERE gh.trangThai = :tt")
//    @Query("SELECT SUM(sp.giaBan * ctgh.soLuong) FROM ChiTietGioHang ctgh JOIN ctgh.gioHang gh JOIN ctgh.sanPham sp JOIN ctgh.maGiamGia WHERE gh.trangThai = :tt GROUP BY sp.groupId")
    @Query("SELECT SUM((sp.giaBan * ctgh.soLuong) - (sp.giaBan * ctgh.soLuong) * COALESCE(mgg.discount, 0)) " +
            "FROM ChiTietGioHang ctgh " +
            "JOIN ctgh.gioHang gh " +
            "JOIN ctgh.sanPham sp " +
            "LEFT JOIN ctgh.maGiamGia mgg " +
            "WHERE gh.trangThai = :tt "
            )
    Double countDoanhThuByTrangThai(@Param("tt") String trangThai);

    @Query("SELECT EXTRACT(MONTH FROM gh.ngayTao) AS month, " +
            "SUM((sp.giaBan * ctgh.soLuong) - (sp.giaBan * ctgh.soLuong) * COALESCE(mgg.discount, 0)) AS doanhThu " +
            "FROM ChiTietGioHang ctgh " +
            "JOIN ctgh.gioHang gh " +
            "JOIN ctgh.sanPham sp " +
            "LEFT JOIN ctgh.maGiamGia mgg " +
            "WHERE gh.trangThai = :tt AND EXTRACT(YEAR FROM gh.ngayTao) = :year " +
            "GROUP BY EXTRACT(MONTH FROM gh.ngayTao) " +
            "ORDER BY EXTRACT(MONTH FROM gh.ngayTao)")
    List<Object[]> countDoanhThuByTrangThaiAndYear(@Param("tt") String trangThai, @Param("year") int year);


    List<GioHang> findByKhachHangEquals(KhachHang khachHang);
}
