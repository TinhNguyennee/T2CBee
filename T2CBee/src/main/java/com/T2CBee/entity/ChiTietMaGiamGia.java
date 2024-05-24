package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "ChiTietMaGiamGia")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietMaGiamGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "ma_giam_gia")
    private MaGiamGia maGiamGia;
}
