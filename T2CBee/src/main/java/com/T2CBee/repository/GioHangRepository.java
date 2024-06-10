package com.T2CBee.repository;

import com.T2CBee.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.HashMap;
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



    // Tìm giỏ hàng trang thái đang null bằng mã khách hàng
    @Query("SELECT gh FROM GioHang gh WHERE gh.khachHang.maKhachHang = :maKhachHang AND gh.trangThai is NULL")
    List <GioHang> findByMaKhachHangAndTrangThaiIsNull(@Param("maKhachHang") int maKhachHang);


    //Tìm các item nằm trong giỏ hàng bằng mã khách hàng và mã gio hàng
    @Query("SELECT ctgh FROM ChiTietGioHang ctgh WHERE ctgh.gioHang.khachHang.maKhachHang = :maKhachHang AND ctgh.gioHang.id = :maGioHang")
    List<ChiTietGioHang> findAllByMaKhachHangAndMaGioHang(@Param("maKhachHang") int maKhachHang, @Param("maGioHang") int maGioHang);

    // Tìm tát cả các mã giảm giá cho các sp có trong giỏ hàng
    @Query("SELECT sp, mgg FROM ChiTietGioHang ctgh " +
            "JOIN ctgh.sanPham sp " +
            "JOIN ChiTietMaGiamGia ctmg ON ctmg.sanPham = sp " +
            "JOIN ctmg.maGiamGia mgg " +
            "WHERE ctgh.gioHang.id = :cartId AND mgg.ngayKetThuc >= CURRENT_DATE")
    HashMap<SanPham, MaGiamGia> findDiscountsForProductsInCart(@Param("cartId") int cartId);

    // tìm sản phẩm và mã giảm giá của sản phẩm có trong giỏ hàng khi có code mã
    @Query("SELECT distinct sp, mgg FROM ChiTietGioHang ctgh " +
            "JOIN ctgh.sanPham sp " +
            "JOIN ChiTietMaGiamGia ctmg ON ctmg.sanPham = sp " +
            "JOIN ctmg.maGiamGia mgg " +
            "WHERE ctgh.gioHang.id = :cartId AND mgg.maGiamGia = :discountCode AND mgg.ngayKetThuc >= CURRENT_DATE")
    List<Object[]>  findProductWithDiscountInCart(@Param("cartId") int cartId, @Param("discountCode") String discountCode);



}
