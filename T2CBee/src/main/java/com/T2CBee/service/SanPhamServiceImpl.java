package com.T2CBee.service;

import com.T2CBee.entity.SanPham;
import com.T2CBee.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamServiceImpl implements SanPhamService {
    @Autowired
    SanPhamRepository dao;

    @Override
    public List<SanPham> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<SanPham> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public SanPham findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<SanPham> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public SanPham save(SanPham emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public Page<SanPham> findByDanhMuc(String danhMuc, Pageable pageable) {
        return dao.findByDanhMuc(danhMuc, pageable);
    }

    @Override
    public List<SanPham> findNewProducts() {
        return dao.findNewProducts();
    }

    @Override
    public Page<SanPham> findByDanhMucAndGiaBetween(String danhMuc, double minPrice, double maxPrice, Pageable pageable) {
        return dao.findByDanhMucAndGiaBanBetween(danhMuc, minPrice, maxPrice, pageable);
    }

    @Override
    public Page<SanPham> findByPriceBetween(double minPrice, double maxPrice, Pageable pageable) {
        return dao.findByGiaBanBetween(minPrice, maxPrice, pageable);
    }
    
    

}
