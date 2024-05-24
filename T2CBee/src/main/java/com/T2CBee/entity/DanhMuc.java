package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "DanhMuc")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maDanhMuc;

    @Column(name = "ten_danh_muc")
    private String tenDanhMuc;

    @Column(name = "ngay_them")
    private LocalDate ngayThem;

    @Column(name = "ngay_xoa")
    private LocalDate ngayXoa;

    @Column(name = "ngay_cap_nhat")
    private LocalDate ngayCapNhat;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;
}

