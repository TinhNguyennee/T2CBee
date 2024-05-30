package com.T2CBee.repository;

import com.T2CBee.entity.NhanVien;
import com.T2CBee.entity.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public  interface ThuongHieuRepository extends JpaRepository<ThuongHieu, String> {
    @Query("SELECT e FROM ThuongHieu e WHERE " +
            "e.maThuongHieu LIKE %:keyword% " +
            "OR e.tenThuongHieu LIKE %:keyword% ")
    Page<ThuongHieu> findByKeyword(@Param("keyword") String keyword, Pageable pageable);
}
