package com.T2CBee.service;

import com.T2CBee.entity.ChiTietMaGiamGia;
import com.T2CBee.repository.ChiTietMaGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiTietMaGiamGiaServiceImpl implements ChiTIetMaGiamGiaService{

    @Autowired
    private ChiTietMaGiamGiaRepository dao;

    @Override
    public List<ChiTietMaGiamGia> findAll() {
        return dao.findAll();
    }

    @Override
    public ChiTietMaGiamGia findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public ChiTietMaGiamGia save(ChiTietMaGiamGia emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public ChiTietMaGiamGia findExistChiTietMaGiamGia(String maGiamGia, Integer maSanPham) {
        return dao.findExistChiTietMaGiamGia(maGiamGia, maSanPham);
    }
}
