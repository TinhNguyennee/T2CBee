package com.T2CBee.service;

import com.T2CBee.entity.DanhMuc;
import com.T2CBee.repository.DanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DanhMucServiceImpl implements DanhMucService{

    @Autowired
    private DanhMucRepository dao;

    @Override
    public List<DanhMuc> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<DanhMuc> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public DanhMuc findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<DanhMuc> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public DanhMuc save(DanhMuc emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }
}
