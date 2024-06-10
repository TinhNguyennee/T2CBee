package com.T2CBee.controller.user;

import com.T2CBee.entity.*;
import com.T2CBee.service.*;
import com.T2CBee.util.BreadcrumbUtil;
import com.T2CBee.util.CartMiniUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class CartController {
    @Autowired
    GioHangService cartService;
    @Autowired
    SessionService sessionService;
    @Autowired
    CartMiniUtil cartMiniUtil;
    @Autowired
    SanPhamService sanPhamService;
    @Autowired
    ChiTietGioHangService chiTietGioHangService;
    @Autowired
    MaGiamGiaService giamGiaService;
    List<Object> lstBreadcrumb = BreadcrumbUtil.createBreadcrumbList();
    @Autowired
    KhachHangService khachHangService;

    @GetMapping("/gio-hang")
    public String viewCart(Model model) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            List<ChiTietGioHang> lstItemCart = cartService.getCartInSession(kh);
        } else {
            List<ChiTietGioHang> cart = sessionService.get("cartItem");
            if (cart == null) {
                cart = new ArrayList<>();
                sessionService.set("cartItem", cart);
            }
        }

        cartMiniUtil.showCartMini(model);
        model.addAttribute("path", "page/cart");
        lstBreadcrumb.removeAll(lstBreadcrumb);
        BreadcrumbUtil.addBreadcrumb("Giỏ hàng", "/gio-hang", lstBreadcrumb);
        model.addAttribute("breadcrumb", lstBreadcrumb);
        return "index";
    }

    @RequestMapping("/gio-hang/them/{maSanPham}")
    public String addToCart(@PathVariable int maSanPham, @RequestParam("soLuong") Optional<Integer> soLuong, Model model) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            cartService.addToCart(kh, maSanPham, soLuong);
            cartService.setCartInSession(kh);
        } else {
            SanPham sanPham = sanPhamService.findById(maSanPham);
            if (sanPham == null) {
                return "redirect:/gio-hang";
            }
            List<ChiTietGioHang> cart = sessionService.get("cartItem");
            if (cart == null) {
                cart = new ArrayList<>();
                sessionService.set("cartItem", cart);
            }
            for (ChiTietGioHang gioHangItem : cart) {
                if (gioHangItem.getSanPham().getMaSanPham() == maSanPham) {
                    gioHangItem.setSoLuong(gioHangItem.getSoLuong() + soLuong.orElse(1));
                    return "redirect:/gio-hang";
                }
            }
            ChiTietGioHang ctgh = new ChiTietGioHang();
            ctgh.setGioHang(new GioHang());
            ctgh.setSanPham(sanPhamService.findById(maSanPham));
            ctgh.setSoLuong(soLuong.orElse(1));
            cart.add(ctgh);
        }
        cartMiniUtil.showCartMini(model);
        return "redirect:/gio-hang";
    }

    @GetMapping("/gio-hang/xoa/{maSanPham}")
    public String removeFromCart(@PathVariable int maSanPham, Model model) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            cartService.removeFromCart(kh, maSanPham);
            cartService.setCartInSession(kh);
        } else {
            List<ChiTietGioHang> cart = sessionService.get("cartItem");
            if (cart != null) {
                Iterator<ChiTietGioHang> iterator = cart.iterator();
                while (iterator.hasNext()) {
                    ChiTietGioHang gioHangItem = iterator.next();
                    if (gioHangItem.getSanPham().getMaSanPham() == maSanPham) {
                        iterator.remove(); // Loại bỏ phần tử hiện tại từ danh sách
                    }
                }
            }
        }
        cartMiniUtil.showCartMini(model);
        return "redirect:/gio-hang";
    }

    @PostMapping("/gio-hang/cap-nhat/{maSanPham}")
    public String updateCart(@PathVariable int maSanPham, @RequestParam("soLuong") int soLuong, Model model) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            cartService.updateCart(kh, maSanPham, soLuong);
            cartService.setCartInSession(kh);
        } else {
            List<ChiTietGioHang> cart = sessionService.get("cartItem");
            if (cart != null) {
                for (ChiTietGioHang gioHangItem : cart) {
                    if (gioHangItem.getSanPham().getMaSanPham() == maSanPham) {
                        gioHangItem.setSoLuong(soLuong);
                    }
                }
            }
        }
        cartMiniUtil.showCartMini(model);
        return "redirect:/gio-hang";
    }

    @RequestMapping("/thanh-toan")
    public String thanhToan(Model model, @RequestParam(name = "productVoucher", required = false) Optional<String> productVoucher) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            List<ChiTietGioHang> cart = cartService.getCartInSession(kh);
            int cartId = cart.get(0).getGioHang().getId();
            System.out.println("Cart số" + cartId);
            System.out.println("User" + kh.getHoVaTen());
            System.out.println("voucher" + productVoucher);
            if (productVoucher.isPresent()) {

                Map<SanPham, MaGiamGia> discount = cartService.findProductWithDiscountInCart(cartId, productVoucher);
                if (discount.isEmpty()) {
                    model.addAttribute("mess", "Voucher đã được hết hoặc chưa đúng!");
                }
                model.addAttribute("discount", discount);
            }
        }
        model.addAttribute("path", "page/checkout");
        lstBreadcrumb.removeAll(lstBreadcrumb);
        BreadcrumbUtil.addBreadcrumb("Giỏ hàng", "/gio-hang", lstBreadcrumb);
        BreadcrumbUtil.addBreadcrumb("Thanh toán", "/thanh-toan", lstBreadcrumb);
        model.addAttribute("breadcrumb", lstBreadcrumb);
        return "index";
    }

    @PostMapping("/dat-hang/{cartId}")
    public String datHang(@PathVariable(name = "cartId") int cartId, Model model, @RequestParam(name = "diaChi") String diaChi, @RequestParam(name = "productVoucher", required = false) Optional<String> productVoucher) {
        KhachHang kh = sessionService.get("user");
        if (kh != null) {
            List<ChiTietGioHang> cart = cartService.getCartInSession(kh);
            List<SanPham> lstSanPham = sanPhamService.findAll();
            Map<SanPham, MaGiamGia> discount = cartService.findProductWithDiscountInCart(cartId, productVoucher);
            List<SanPham> lstSanPhamHaveVoucher = new ArrayList<>(discount.keySet());
            if (cart != null) {
                for (ChiTietGioHang itemCart : cart) {
                    updateProductQuantity(lstSanPham, itemCart);
                    if (productVoucher.isPresent()) {
                        applyVoucher(lstSanPhamHaveVoucher, itemCart, productVoucher.get());
                    }
                }
            }
            kh.setDiaChi(diaChi);
            System.out.println(diaChi);
            khachHangService.save(kh);
            GioHang giohang = cartService.findById(cartId);
            giohang.setTrangThai("CHO_XU_LY");
            cartService.save(giohang);
        }
        cartMiniUtil.showCartMini(model);
        return "redirect:/don-hang-cua-toi";
    }

    private void updateProductQuantity(List<SanPham> lstSanPham, ChiTietGioHang itemCart) {
        for (SanPham sanPham : lstSanPham) {
            if (sanPham.getMaSanPham() == itemCart.getSanPham().getMaSanPham()) {
                sanPham.setSoLuong(sanPham.getSoLuong() - itemCart.getSoLuong());
                sanPhamService.save(sanPham);
            }
        }
    }

    private void applyVoucher(List<SanPham> lstSanPhamHaveVoucher, ChiTietGioHang itemCart, String maGiamGia) {
        for (SanPham sanPham : lstSanPhamHaveVoucher) {
            if (sanPham.getMaSanPham() == itemCart.getSanPham().getMaSanPham()) {
                itemCart.setMaGiamGia(giamGiaService.findById(maGiamGia));
                chiTietGioHangService.save(itemCart);
            }
        }
    }
}


