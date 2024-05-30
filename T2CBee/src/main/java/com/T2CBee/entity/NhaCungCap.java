package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.cglib.core.Local;

import java.time.LocalDate;

@Entity
@Table(name = "Nhacungcap")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NhaCungCap {
    @Id
    @Column(name = "ma_nha_cung_cap", columnDefinition = "NCHAR(10)", nullable = false)
    String maNhaCungCap;

    @Column(name = "ten_nha_cung_cap", columnDefinition = "NVARCHAR(150)", nullable = false)
    String tenNhaCungCap;

    @Column(name = "ma_so_thue", columnDefinition = "NCHAR(10)", nullable = true)
    String maSoThue;

    @Column(name = "so_dien_thoai", columnDefinition = "NCHAR(14)", nullable = true)
    String soDienThoai;

    @Column(name = "dia_chi", columnDefinition = "NVARCHAR(50)", nullable = true)
     String diaChi;

    @ManyToOne
    @JoinColumn(name = "nguoi_them", columnDefinition = "NCHAR(10)", nullable = true)
     NhanVien nguoiThem;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_them", columnDefinition = "DATE", nullable = true)
    LocalDate ngayThem;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_cap_nhat", columnDefinition = "DATE", nullable = true)
    LocalDate ngayCapNhat;

    @PrePersist
    protected void onCreate() {
        ngayThem = LocalDate.now();
        ngayCapNhat = LocalDate.now();
    }

    @PreUpdate
    protected void onUpdate() {
        ngayCapNhat = LocalDate.now();
    }
}
