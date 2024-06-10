package com.T2CBee.service;

import com.T2CBee.entity.MaGiamGia;
import com.T2CBee.repository.MaGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaGiamGiaImpl implements MaGiamGiaService {
    @Autowired
    private MaGiamGiaRepository dao;

    @Override
    public List<MaGiamGia> findAll() {
        return dao.findAll();
    }

    @Override
    public MaGiamGia findById(String id) {
        return dao.findById(id).get();
    }

    @Override
    public MaGiamGia save(MaGiamGia emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(String id) {
        dao.deleteById(id);
    }
}
