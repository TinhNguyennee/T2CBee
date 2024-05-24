package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "ChiTietDanhMuc")
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
}
