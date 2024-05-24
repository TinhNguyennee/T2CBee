package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "ThuongHieu")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ThuongHieu {
    @Id
    private String maThuongHieu;

    @Column(name = "ten_thuong_hieu")
    private String tenThuongHieu;

    @Column(name = "ngay_them")
    private LocalDate ngayThem;

    @Column(name = "ngay_cap_nhat")
    private LocalDate ngayCapNhat;

    @ManyToOne
    @JoinColumn(name = "nguoi_them")
    private NhanVien nguoiThem;
}
