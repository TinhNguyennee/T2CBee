package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "Chitietgiohang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChiTietGioHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "ma_gio_hang")
    private GioHang gioHang;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham")
    private SanPham sanPham;

    @Column(name = "so_luong")
    private int soLuong;

    @ManyToOne
    @JoinColumn(name = "ma_giam_gia")
    private MaGiamGia maGiamGia;

    @Override
    public String toString() {
        return id + " " + gioHang.getId() + " " + sanPham.getTenSanPham();
    }
}
