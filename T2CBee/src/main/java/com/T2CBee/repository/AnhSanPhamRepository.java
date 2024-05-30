package com.T2CBee.repository;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.ChiTietDanhMuc;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AnhSanPhamRepository extends JpaRepository<AnhSanPham, Integer> {
    @Query("SELECT e FROM AnhSanPham e WHERE e.url = :url and e.sanPham.maSanPham = :masp")
    AnhSanPham findExistAnhSanPham(@Param("url") String url, @Param("masp") Integer masp);

    @Transactional
    @Modifying
    @Query("DELETE FROM AnhSanPham e where e.sanPham.maSanPham = :masp")
    void deleteAllAnhSanPhamBySanPhamID(@Param("masp") Integer masp);
}
