package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "Thuonghieu")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ThuongHieu {
    @Id
    @Column(name = "ma_thuong_hieu")
    private String maThuongHieu;

    @Column(name = "ten_thuong_hieu")
    private String tenThuongHieu;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_them", columnDefinition = "DATE", nullable = true)
    private LocalDate ngayThem;

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

    @Override
    public String toString() {
        return tenThuongHieu;
    }
}
