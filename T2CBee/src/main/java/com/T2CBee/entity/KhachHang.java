package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "KhachHang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maKhachHang;

    @Column(name = "ho_va_ten")
    private String hoVaTen;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    @Column(name = "gioi_tinh")
    private boolean gioiTinh;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "ngay_sinh")
    private LocalDate ngaySinh;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private List<SanPhamYeuThich> sanPhamYeuThichList;

    @OneToMany(mappedBy = "nguoiBinhLuan", fetch = FetchType.LAZY)
    private List<BinhLuan> binhLuanList;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private List<GioHang> gioHangList;

}
