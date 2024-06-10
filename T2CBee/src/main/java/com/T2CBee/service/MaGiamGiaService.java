package com.T2CBee.service;

import com.T2CBee.entity.ChiTietMaGiamGia;
import com.T2CBee.entity.MaGiamGia;

import java.util.List;

public interface MaGiamGiaService {
    List<MaGiamGia> findAll();

    MaGiamGia findById(String id);

    MaGiamGia save(MaGiamGia emp);

    void deleteById(String id);

}
