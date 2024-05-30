package com.T2CBee.service;

import com.T2CBee.entity.ThuongHieu;
import com.T2CBee.repository.ThuongHieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ThuongHieuServiceImpl implements ThuongHieuService{

    @Autowired
    private ThuongHieuRepository dao;

    @Override
    public List<ThuongHieu> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<ThuongHieu> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public ThuongHieu findById(String id) {
        return dao.findById(id).get();
    }

    @Override
    public ThuongHieu save(ThuongHieu emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(String id) {
        dao.deleteById(id);
    }

    @Override
    public Page<ThuongHieu> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }
}
