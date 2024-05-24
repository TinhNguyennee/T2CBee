package com.T2CBee.entity;

import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

public class ChiTietGioHang {
    @ManyToOne
    @JoinColumn(name = "ma_gio_hang")
    private int maGioHang;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham")
    private int maSanPham;

    @Column(name = "so_luong")
    private int soLuong;
}
