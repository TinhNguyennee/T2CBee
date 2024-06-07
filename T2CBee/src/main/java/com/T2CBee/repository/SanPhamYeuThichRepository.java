package com.T2CBee.repository;

import com.T2CBee.entity.KhachHang;
import com.T2CBee.entity.SanPhamYeuThich;
import com.T2CBee.entity.ThuongHieu;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SanPhamYeuThichRepository  extends JpaRepository<SanPhamYeuThich, Integer> {
    Page<SanPhamYeuThich> findByKhachHangEquals(KhachHang khachHang, Pageable pageable);
}
