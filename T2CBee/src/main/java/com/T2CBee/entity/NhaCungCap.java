package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "NhaCungCap")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NhaCungCap {
    @Id
    private String maNhaCungCap;

    @Column(name = "ten_nha_cung_cap")
    private String tenNhaCungCap;

    @Column(name = "ma_so_thue")
    private String maSoThue;

    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    @Column(name = "dia_chi")
    private String diaChi;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;

    @Column(name = "ngay_them")
    private LocalDate ngayThem;

    @Column(name = "ngay_cap_nhat")
    private LocalDate ngayCapNhat;
}
