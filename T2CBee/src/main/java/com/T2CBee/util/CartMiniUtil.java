package com.T2CBee.util;

import com.T2CBee.entity.ChiTietGioHang;
import com.T2CBee.entity.GioHang;
import com.T2CBee.entity.KhachHang;
import com.T2CBee.service.GioHangService;
import com.T2CBee.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import java.util.List;

@Component
public class CartMiniUtil {
    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private SessionService sessionService;

    public void showCartMini(Model model) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            GioHang cart = gioHangService.findByMaKhachHangAndTrangThaiIsNull(kh.getMaKhachHang());
            if (cart != null) {
                List<ChiTietGioHang> lstItemCart = gioHangService.findAllByMaKhachHangAndMaGioHang(kh.getMaKhachHang(), cart.getId());
                sessionService.set("cartItem", lstItemCart);
            }
        }
    }
}
