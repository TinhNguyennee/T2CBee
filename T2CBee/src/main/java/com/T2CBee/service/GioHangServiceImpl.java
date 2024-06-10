package com.T2CBee.service;

import com.T2CBee.entity.*;
import com.T2CBee.repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class GioHangServiceImpl implements GioHangService{

    @Autowired
    GioHangRepository dao;

    @Override
    public List<GioHang> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<GioHang> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public GioHang findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<GioHang> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public GioHang save(GioHang emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public List<GioHang> findByTrangThai(String trangThai) {
        return dao.findByTrangThai(trangThai);
    }

    @Override
    public Page<GioHang> findByTrangThai(String trangThai, Pageable pageable) {
        return dao.findByTrangThai(trangThai.trim(), pageable);
    }

    @Override
    public Double countDoanhThuByTrangThai(String trangThai) {
        Double doanhThu = dao.countDoanhThuByTrangThai(trangThai);
        return doanhThu != null ? doanhThu : 0.0;
    }

    @Override
    public List<Object[]> countDoanhThuByTrangThaiAndYear(String trangThai, int year) {
        return dao.countDoanhThuByTrangThaiAndYear(trangThai, year);
    }
    @Autowired
    private SessionService sessionService;
    @Autowired
    private SanPhamService sanPhamDao;
    @Autowired
    private ChiTietGioHangService chiTietGioHangDao;
    @Override
    public GioHang findByMaKhachHangAndTrangThaiIsNull(int maKhachHang) {
        List<GioHang> lst = dao.findByMaKhachHangAndTrangThaiIsNull(maKhachHang);
        if (!lst.isEmpty()) {
            return lst.get(0);
        }
        return null; // or handle the case where no result is found
    }

    @Override
    public List<ChiTietGioHang> findAllByMaKhachHangAndMaGioHang(int maKhachHang, int maGioHang) {
        return dao.findAllByMaKhachHangAndMaGioHang(maKhachHang, maGioHang);
    }

    @Override
    public GioHang getOrCreateCart(KhachHang kh) {
        GioHang cart = findByMaKhachHangAndTrangThaiIsNull(kh.getMaKhachHang());
        if (cart == null) {
            cart = new GioHang();
            cart.setKhachHang(kh);
            cart = save(cart);
        }
        return cart;
    }

    @Override
    public List<ChiTietGioHang> getCartItems(KhachHang kh, GioHang cart) {
        List<ChiTietGioHang> lst = sessionService.get("cartItem");
        if (lst == null || lst.isEmpty()) {
            System.out.println("getCartItem session cart is null");
            lst = findAllByMaKhachHangAndMaGioHang(kh.getMaKhachHang(), cart.getId());
        }
        else{
            if(lst.get(0).getGioHang().getId() == 0){
                System.out.println("chuyển 0 sang cart");
                 cart = getOrCreateCart(kh);
                 for(ChiTietGioHang ct: lst){
                     ct.setGioHang(cart);
                     chiTietGioHangDao.save(ct);
                }

            }
        }
        return lst;
    }

    @Override
    public void addToCart(KhachHang kh, int maSanPham, Optional<Integer> soLuong) {
        GioHang cart = getOrCreateCart(kh);
        List<ChiTietGioHang> lstItemCart = getCartItems(kh, cart);
        for (ChiTietGioHang chi : lstItemCart) {
            if (chi.getSanPham().getMaSanPham() == maSanPham) {
                chi.setSoLuong(chi.getSoLuong() + soLuong.orElse(1));
                chiTietGioHangDao.save(chi);
                return;
            }
        }

        ChiTietGioHang ctgh = new ChiTietGioHang();
        ctgh.setGioHang(cart);
        ctgh.setSanPham(sanPhamDao.findById(maSanPham));
        ctgh.setSoLuong(soLuong.orElse(1));
        chiTietGioHangDao.save(ctgh);
    }

    @Override
    public void removeFromCart(KhachHang kh, int maSanPham) {
        GioHang cart = getOrCreateCart(kh);
        List<ChiTietGioHang> lstItemCart = getCartItems(kh, cart);
        for (ChiTietGioHang chi : lstItemCart) {
            if (chi.getSanPham().getMaSanPham() == maSanPham) {
                chiTietGioHangDao.deleteById(chi.getId());
                return;
            }
        }
    }

    @Override
    public void updateCart(KhachHang kh, int maSanPham, int soLuong) {
        GioHang cart = getOrCreateCart(kh);
        List<ChiTietGioHang> lstItemCart = getCartItems(kh, cart);
        for (ChiTietGioHang chi : lstItemCart) {
            if (chi.getSanPham().getMaSanPham() == maSanPham) {
                chi.setSoLuong(soLuong);
                chiTietGioHangDao.save(chi);
                return;
            }
        }
    }

    @Override
    public void setCartInSession(KhachHang kh) {
        GioHang cart = getOrCreateCart(kh);
        List<ChiTietGioHang> lstItemCart = getCartItems(kh, cart);
        sessionService.set("cart", cart);
        sessionService.set("cartItem", lstItemCart);
    }

    @Override
    public List<ChiTietGioHang> getCartInSession(KhachHang kh) {
        GioHang cart = getOrCreateCart(kh);
        List<ChiTietGioHang> lstItemCart = getCartItems(kh, cart);
        sessionService.set("cart", cart);
        sessionService.set("cartItem", lstItemCart);
        return lstItemCart;
    }

    public Map<SanPham, MaGiamGia> findProductWithDiscountInCart(int cartId, Optional<String> discountCode) {
        List<Object[]> discountObject =
                dao.findProductWithDiscountInCart(
                        (cartId),
                        discountCode.get());
        if (!discountObject.isEmpty()) {
            Map<SanPham, MaGiamGia> mapDiscount = new HashMap<>();
            discountObject.forEach(result -> {
                SanPham sanPham = (SanPham) result[0];
                MaGiamGia maGiamGia = (MaGiamGia) result[1];
                mapDiscount.put(sanPham, maGiamGia);
            });
            return mapDiscount;
        }
        return new HashMap<>();

    }

}
