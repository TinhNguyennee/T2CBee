package com.T2CBee.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Table(name = "Binhluan")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BinhLuan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "nguoi_binh_luan")
    private KhachHang nguoiBinhLuan;

    @ManyToOne
    @JoinColumn(name = "san_pham")
    private SanPham sanPham;

    @Column(name = "binh_luan")
    private String binhLuan;

    @Column(name = "ngay_binh_luan")
    private LocalDate ngayBinhLuan;

    @Column(name = "danh_gia")
    private short danhGia;

    @Column(name = "bao_cao_sai_pham")
    private boolean baoCaoSaiPham;

    @PrePersist
    protected void onCreate() {
        ngayBinhLuan = LocalDate.now();
    }

}
