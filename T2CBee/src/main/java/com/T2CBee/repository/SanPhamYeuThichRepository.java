package com.T2CBee.repository;

import com.T2CBee.entity.KhachHang;
import com.T2CBee.entity.SanPham;
import com.T2CBee.entity.SanPhamYeuThich;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SanPhamYeuThichRepository  extends JpaRepository<SanPhamYeuThich, Integer> {
    Page<SanPhamYeuThich> findByKhachHangEquals(KhachHang khachHang, Pageable pageable);


    SanPhamYeuThich findByKhachHangEqualsAndSanPhamEquals(KhachHang khachHang, Optional<SanPham> sanPham);

}
