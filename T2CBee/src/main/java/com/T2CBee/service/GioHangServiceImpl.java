package com.T2CBee.service;

import com.T2CBee.entity.GioHang;
import com.T2CBee.repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GioHangServiceImpl implements GioHangService{

    @Autowired
    GioHangRepository dao;

    @Override
    public List<GioHang> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<GioHang> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public GioHang findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<GioHang> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public GioHang save(GioHang emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public List<GioHang> findByTrangThai(String trangThai) {
        return dao.findByTrangThai(trangThai);
    }

    @Override
    public Page<GioHang> findByTrangThai(String trangThai, Pageable pageable) {
        return dao.findByTrangThai(trangThai.trim(), pageable);
    }

    @Override
    public Double countDoanhThuByTrangThai(String trangThai) {
        Double doanhThu = dao.countDoanhThuByTrangThai(trangThai);
        return doanhThu != null ? doanhThu : 0.0;
    }

    @Override
    public List<Object[]> countDoanhThuByTrangThaiAndYear(String trangThai, int year) {
        return dao.countDoanhThuByTrangThaiAndYear(trangThai, year);
    }
}
