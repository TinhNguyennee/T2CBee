package com.T2CBee.service;

import com.T2CBee.entity.ChiTietGioHang;
import com.T2CBee.repository.ChiTietGioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChiTietGioHangServiceImpl implements ChiTietGioHangService{

    @Autowired
    ChiTietGioHangRepository dao;

    @Override
    public List<ChiTietGioHang> findAll() {
        return dao.findAll();
    }

    @Override
    public ChiTietGioHang findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public ChiTietGioHang save(ChiTietGioHang emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public Page<ChiTietGioHang> findChiTietGioHangByGioHangId(Integer maGioHang, Pageable pageable) {
        return dao.findChiTietGioHangByGioHangId(maGioHang, pageable);
    }
}
