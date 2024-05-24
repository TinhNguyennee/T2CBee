package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "MaGiamGia")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MaGiamGia {
    @Id
    private String maGiamGia;

    @Column(name = "discount")
    private String discount;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham")
    private SanPham sanPham;

    @Column(name = "ngay_bat_dau")
    private LocalDate ngayBatDau;

    @Column(name = "ngay_ket_thuc")
    private LocalDate ngayKetThuc;

    @Column(name = "so_luong")
    private int soLuong;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;
}
