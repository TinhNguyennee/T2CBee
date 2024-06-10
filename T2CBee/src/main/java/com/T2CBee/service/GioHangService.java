package com.T2CBee.service;

import com.T2CBee.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface GioHangService {
    List<GioHang> findAll();

    Page<GioHang> findAll(Pageable pageable);

    GioHang findById(Integer id);

    Page<GioHang> findByKeyword(String keyword, Pageable pageable);

    GioHang save(GioHang emp);

    void deleteById(Integer id);

    List<GioHang> findByTrangThai(String trangThai);

    Page<GioHang> findByTrangThai(String trangThai, Pageable pageable);

    Double countDoanhThuByTrangThai(String trangThai);

    List<Object[]> countDoanhThuByTrangThaiAndYear(String trangThai, int year);

    GioHang findByMaKhachHangAndTrangThaiIsNull(int maKhachHang);

    List<ChiTietGioHang> findAllByMaKhachHangAndMaGioHang(int maKhachHang, int maGioHang);

    GioHang getOrCreateCart(KhachHang kh);

    List<ChiTietGioHang> getCartItems(KhachHang kh, GioHang cart);

    void addToCart(KhachHang kh, int maSanPham, Optional<Integer> soLuong);

    void removeFromCart(KhachHang kh, int maSanPham);

    void updateCart(KhachHang kh, int maSanPham, int soLuong);

    void setCartInSession(KhachHang kh);

    List<ChiTietGioHang> getCartInSession(KhachHang kh);

    Map<SanPham, MaGiamGia> findProductWithDiscountInCart(int cartId, Optional<String> discountCode);

}
