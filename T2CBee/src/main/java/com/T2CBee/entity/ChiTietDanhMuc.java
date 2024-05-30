package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Chitietdanhmuc")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietDanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "ma_danh_muc")
    private DanhMuc danhMuc;

    @Override
    public String toString() {
        return danhMuc.getTenDanhMuc();
    }
}
