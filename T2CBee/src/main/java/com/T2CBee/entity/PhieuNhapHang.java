package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "Phieunhaphang")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PhieuNhapHang {
    @Id
    private String maPhieuNhap;

    @ManyToOne
    @JoinColumn(name = "nha_cung_cap")
    private NhaCungCap nhaCungCap;

    @Column(name = "trang_thai")
    private String trangThai;

    @ManyToOne
    @JoinColumn(name = "nguoi_nhap")
    private NhanVien nguoiNhap;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_nhap", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayNhap;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_cap_nhat", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayCapNhat;

    @PrePersist
    protected void onCreate() {
        ngayNhap = LocalDate.now();
        ngayCapNhat = LocalDate.now();
    }

    @PreUpdate
    protected void onUpdate() {
        ngayCapNhat = LocalDate.now();
    }
}
