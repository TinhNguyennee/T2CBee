package com.T2CBee.service;

import com.T2CBee.entity.ChiTietDanhMuc;
import com.T2CBee.entity.DanhMuc;
import com.T2CBee.repository.ChiTietDanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ChiTietDanhMucServiceImpl implements ChiTietDanhMucService{

    @Autowired
    ChiTietDanhMucRepository dao;
    
    @Override
    public List<ChiTietDanhMuc> findAll() {
        return dao.findAll();
    }

    @Override
    public ChiTietDanhMuc findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public ChiTietDanhMuc save(ChiTietDanhMuc emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public ChiTietDanhMuc findExistChiTietDanhMuc(Integer maDanhMuc, Integer maSanPham) {
        return dao.findExistChiTietDanhMuc(maDanhMuc, maSanPham);
    }

    @Override
    public void deleteAllChiTietDanhMucBySanPhamID(Integer maSanPham) {
        dao.deleteAllChiTietDanhMucBySanPhamID(maSanPham);
    }

    @Override
    public List<DanhMuc> getAllDanhMucs() {
        return dao.findAllDanhMucs();
    }
}
