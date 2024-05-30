package com.T2CBee.repository;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.ChiTietMaGiamGia;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ChiTietMaGiamGiaRepository extends JpaRepository<ChiTietMaGiamGia, Integer> {
    @Query("SELECT e FROM ChiTietMaGiamGia e WHERE e.maGiamGia.maGiamGia = :magg and e.sanPham.maSanPham = :masp")
    ChiTietMaGiamGia findExistChiTietMaGiamGia(@Param("magg") String magg, @Param("masp") Integer masp);

    @Transactional
    @Modifying
    @Query("DELETE FROM ChiTietMaGiamGia e where e.maGiamGia.maGiamGia = :magg")
    void deleteAllMaGiamGiaBySanPhamID(@Param("magg") String magg);
}
