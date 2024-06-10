package com.T2CBee.repository;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.BinhLuan;
import com.T2CBee.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {

    @Query("SELECT sp FROM SanPham sp ORDER BY sp.ngayTao DESC")
    List<SanPham> findNewProducts();

    @Query("SELECT sp FROM SanPham sp JOIN sp.danhMucs ctdm JOIN ctdm.danhMuc dm WHERE dm.tenDanhMuc = :danhMuc")
    Page<SanPham> findByDanhMuc(String danhMuc, Pageable pageable);

    @Query("SELECT sp FROM SanPham sp WHERE sp.giaBan BETWEEN :giaMin AND :giaMax " +
            "AND sp.maSanPham IN (SELECT MIN(sp2.maSanPham) FROM SanPham sp2 WHERE sp2.giaBan BETWEEN :giaMin AND :giaMax GROUP BY sp2.groupId)")
    Page<SanPham> findByGiaBanBetween(double giaMin, double giaMax, Pageable pageable);

    @Query("SELECT sp FROM SanPham sp " +
            "JOIN sp.danhMucs ctdm " +
            "JOIN ctdm.danhMuc dm " +
            "WHERE dm.tenDanhMuc = :danhMuc " +
            "AND sp.giaBan BETWEEN :giaMin AND :giaMax " +
            "AND sp.maSanPham IN (" +
            "    SELECT MIN(sp2.maSanPham) " +
            "    FROM SanPham sp2 " +
            "    JOIN sp2.danhMucs ctdm2 " +
            "    JOIN ctdm2.danhMuc dm2 " +
            "    WHERE dm2.tenDanhMuc = :danhMuc " +
            "    AND sp2.giaBan BETWEEN :giaMin AND :giaMax " +
            "    GROUP BY sp2.groupId" +
            ")")
    Page<SanPham> findByDanhMucAndGiaBanBetween(String danhMuc, double giaMin, double giaMax, Pageable pageable);

    @Query("SELECT e FROM SanPham e WHERE " +
            "e.tenSanPham LIKE %:keyword% " +
            "OR e.groupId LIKE %:keyword% " +
            "OR e.thuongHieu.tenThuongHieu LIKE %:keyword% " +
            "OR e.phanLoai LIKE %:keyword% ")
    Page<SanPham> findByKeyword(@Param("keyword") String keyword, Pageable pageable);

    // lấy tất cả ảnh các sản phẩm cùng 1 group
    @Query("SELECT a FROM AnhSanPham a JOIN a.sanPham s WHERE s.groupId = :groupId AND s.hienThi = true")
    List<AnhSanPham> findAllPictureByGroupId(@Param("groupId") String groupId);

    @Query("SELECT a FROM AnhSanPham a JOIN a.sanPham s WHERE s.maSanPham =:id")
    List<AnhSanPham> findPictureBySanPhamId(@Param("id") Integer id);

    // lấy min giá bản các sp cùng group
    @Query("SELECT MIN(s.giaBan) FROM SanPham s WHERE s.groupId = :groupId AND s.hienThi = true")
    Double findMinPriceByGroupId(@Param("groupId") String groupId);

    // lấy max giá bản các sp cùng group
    @Query("SELECT MAX(s.giaBan) FROM SanPham s WHERE s.groupId = :groupId AND s.hienThi = true")
    Double findMaxPriceByGroupId(@Param("groupId") String groupId);

    // lấy các phân loại của các sản phẩm cùng group lấy DISTINCT
    @Query("SELECT DISTINCT s.phanLoai FROM SanPham s WHERE s.groupId = :groupId AND s.hienThi = true")
    List<String> findDistinctPhanLoaiByGroupId(@Param("groupId") String groupId);

    // lấy san pham baang phan loai va goup
    @Query("SELECT s FROM SanPham s WHERE s.groupId = :groupId AND s.hienThi = true AND s.phanLoai= :phanLoai")
    SanPham findSanPhamByPhanLoaiAndGroup(@Param("groupId") String groupId,
                                          @Param("phanLoai") Optional<String> phanLoai);

    // đếm sô đánh giá của all sản phẩm trong group
    @Query("SELECT COUNT(b) FROM BinhLuan b JOIN b.sanPham sp WHERE sp.groupId = :groupId")
    int countTotalReviewsByGroupId(@Param("groupId") String groupId);

    // lấy các bình luận của all sản phẩm cùng 1 group
    @Query("SELECT b FROM BinhLuan b JOIN b.sanPham sp WHERE sp.groupId = :groupId")
    List<BinhLuan> findAllBinhLuanByGroupId(@Param("groupId") String groupId);

    // lấy tất cả tên danh mục thuộc các sản phẩm cùng 1 group
    @Query("SELECT DISTINCT c.danhMuc.tenDanhMuc FROM ChiTietDanhMuc c JOIN c.sanPham s WHERE s.groupId = :groupId AND s.hienThi = true")
    List<String> findDanhMucNamesByGroupId(@Param("groupId") String groupId);

    //Tính tổng sô sao của các sản phẩm trong group
    @Query("SELECT AVG(b.danhGia) FROM BinhLuan b JOIN b.sanPham sp WHERE sp.groupId = :groupId")
    Double findAverageRatingByGroupId(@Param("groupId") String groupId);

    @Query("SELECT COUNT(sp) FROM SanPham sp JOIN sp.danhMucs dm WHERE dm.danhMuc.tenDanhMuc = :tenDanhMuc")
    int countByDanhMuc(@Param("tenDanhMuc") String tenDanhMuc);

    @Query("SELECT COUNT(sp) FROM SanPham sp")
    int countAllSanPham();


}
