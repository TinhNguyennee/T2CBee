package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "Danhmuc")
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

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_them", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayThem;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_xoa", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayXoa;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_cap_nhat", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayCapNhat;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;

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

