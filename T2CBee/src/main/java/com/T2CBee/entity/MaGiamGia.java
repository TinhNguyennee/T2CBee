package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Magiamgia")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MaGiamGia {
    @Id
    private String maGiamGia;

    @Column(name = "discount")
    private String discount;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_bat_dau", columnDefinition = "DATE")
    private LocalDate ngayBatDau;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_ket_thuc", columnDefinition = "DATE")
    private LocalDate ngayKetThuc;

    @Column(name = "so_luong")
    private int soLuong;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_tao", columnDefinition = "DATE")
    private LocalDate ngayTao;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_cap_nhat", columnDefinition = "DATE")
    private LocalDate ngayCapNhat;

    @OneToMany(mappedBy = "maGiamGia", fetch = FetchType.LAZY)
    private List<ChiTietMaGiamGia> chiTietMaGiamGias;

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
