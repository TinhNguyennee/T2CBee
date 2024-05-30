package com.T2CBee.service;

import com.T2CBee.entity.KhachHang;
import com.T2CBee.entity.NhanVien;
import com.T2CBee.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangServiceImpl implements KhachHangService{
    @Autowired
    private KhachHangRepository dao;


    @Override
    public List<KhachHang> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<KhachHang> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public KhachHang findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<KhachHang> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public KhachHang save(KhachHang kh) {
        return dao.save(kh);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }
}
