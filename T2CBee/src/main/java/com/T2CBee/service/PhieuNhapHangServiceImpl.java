package com.T2CBee.service;

import com.T2CBee.entity.PhieuNhapHang;
import com.T2CBee.repository.PhieuNhapRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhieuNhapHangServiceImpl implements PhieuNhapHangService{

    @Autowired
    private PhieuNhapRepository dao;

    @Override
    public List<PhieuNhapHang> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<PhieuNhapHang> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public PhieuNhapHang findById(String id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<PhieuNhapHang> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public PhieuNhapHang save(PhieuNhapHang emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(String id) {
        dao.deleteById(id);
    }
}
