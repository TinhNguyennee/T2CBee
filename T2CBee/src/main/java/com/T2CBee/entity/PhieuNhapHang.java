package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "PhieuNhapHang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PhieuNhapHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maPhieuNhap;

    @ManyToOne
    @JoinColumn(name = "nha_cung_cap")
    private NhaCungCap nhaCungCap;

    @Column(name = "trang_thai")
    private String trangThai;

    @ManyToOne
    @JoinColumn(name = "nguoi_nhap")
    private NhanVien nguoiNhap;

    @Column(name = "ngay_nhap")
    private LocalDate ngayNhap;

    @Column(name = "nguoi_cap_nhat")
    private LocalDate nguoiCapNhat;
}
