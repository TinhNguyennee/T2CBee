package com.T2CBee.repository;

import com.T2CBee.entity.DanhMuc;
import com.T2CBee.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DanhMucRepository extends JpaRepository<DanhMuc, Integer> {
    @Query("SELECT e FROM DanhMuc e WHERE e.tenDanhMuc LIKE %:keyword%")
    Page<DanhMuc> findByKeyword(@Param("keyword") String keyword, Pageable pageable);
}
