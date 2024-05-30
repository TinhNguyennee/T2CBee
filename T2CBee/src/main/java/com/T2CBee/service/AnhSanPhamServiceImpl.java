package com.T2CBee.service;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.repository.AnhSanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnhSanPhamServiceImpl implements AnhSanPhamService{

    @Autowired
    AnhSanPhamRepository dao;

    @Override
    public List<AnhSanPham> findAll() {
        return dao.findAll();
    }

    @Override
    public AnhSanPham findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public AnhSanPham save(AnhSanPham emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public AnhSanPham findExistAnhSanPham(String url, Integer maSanPham) {
        return dao.findExistAnhSanPham(url, maSanPham);
    }

    @Override
    public void deleteAllAnhSanPhamBySanPhamID(Integer maSanPham) {
        dao.deleteAllAnhSanPhamBySanPhamID(maSanPham);
    }
}
