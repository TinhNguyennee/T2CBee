package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "SanPham")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maSanPham;

    @Column(name = "ten_san_pham")
    private String tenSanPham;

    @Column(name = "group_id")
    private String groupId;

    @Column(name = "gia_ban")
    private double giaBan;

    @Column(name = "so_luong")
    private int soLuong;

    @Column(name = "mo_ta", columnDefinition = "TEXT")
    private String moTa;

    @ManyToOne
    @JoinColumn(name = "thuong_hieu")
    private ThuongHieu thuongHieu;

    @Column(name = "trong_luong")
    private double trongLuong;

    @Column(name = "kich_thuoc")
    private String kichThuoc;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<ChiTietDanhMuc> danhMucs;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<AnhSanPham> anhSanPhams;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<BinhLuan> binhLuans;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<ChiTietMaGiamGia> chiTietMaGiamGias;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<SanPhamYeuThich> sanPhamYeuThichs;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;

    @Column(name = "hien_thi")
    private boolean hienThi;

    @ManyToOne
    @JoinColumn(name = "phieu_nhap")
    private PhieuNhapHang phieuNhap;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;

    @Column(name = "ngay_cap_nhat")
    private LocalDate ngayCapNhat;

    @Column(name = "phan_loai")
    private String phanLoai;

    @Column(name = "trang_thai")
    private String trangThai;

}
