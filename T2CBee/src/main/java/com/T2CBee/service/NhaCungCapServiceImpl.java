package com.T2CBee.service;

import com.T2CBee.entity.NhaCungCap;
import com.T2CBee.repository.NhaCungCapRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NhaCungCapServiceImpl implements NhaCungCapService {

    @Autowired
    NhaCungCapRepository dao;

    @Override
    public List<NhaCungCap> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<NhaCungCap> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public NhaCungCap findById(String id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<NhaCungCap> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public NhaCungCap save(NhaCungCap ncc) {
        return dao.save(ncc);
    }

    @Override
    public void deleteById(String id) {
        dao.deleteById(id);
    }
}
