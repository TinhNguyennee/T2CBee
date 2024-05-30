package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Khachhang")
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

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_sinh", columnDefinition = "DATE", nullable = true)
    private Date ngaySinh;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_tao", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayTao;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_cap_nhat", columnDefinition = "DATE", nullable = true)
    LocalDate ngayCapNhat;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private List<SanPhamYeuThich> sanPhamYeuThichList;

    @OneToMany(mappedBy = "nguoiBinhLuan", fetch = FetchType.LAZY)
    private List<BinhLuan> binhLuanList;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private List<GioHang> gioHangList;

    @PrePersist
    protected void onCreate() {
        ngayTao = LocalDate.now();
        ngayCapNhat = LocalDate.now();
    }

    @PreUpdate
    protected void onUpdate() {
        ngayCapNhat = LocalDate.now();
    }

}
