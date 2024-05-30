package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "Nhanvien")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NhanVien {
    @Id
    @Column(name = "ma_nhan_vien")
    private String id;

    @Column(name = "ho_ten")
    private String hoTen;

    @Column(name = "chuc_vu")
    private boolean chucVu;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "email")
    private String email;

    @Column(name = "gioi_tinh")
    private boolean gioiTinh;

    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_vao", columnDefinition = "DATE", nullable = true)
    LocalDate ngayVao;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_cap_nhat", columnDefinition = "DATE", nullable = true)
    LocalDate ngayCapNhat;

    @PrePersist
    protected void onCreate() {
        ngayVao = LocalDate.now();
        ngayCapNhat = LocalDate.now();
    }

    @PreUpdate
    protected void onUpdate() {
        ngayCapNhat = LocalDate.now();
    }
}
