package com.T2CBee.service;

import com.T2CBee.entity.NhaCungCap;
import com.T2CBee.entity.NhanVien;
import com.T2CBee.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhanVienServiceImpl implements NhanVienService{

    @Autowired
    NhanVienRepository nhanVienRepository;

    @Override
    public List<NhanVien> findAll() {
        return nhanVienRepository.findAll();
    }

    @Override
    public Page<NhanVien> findAll(Pageable pageable) {
        return nhanVienRepository.findAll(pageable);
    }

    @Override
    public NhanVien findById(String id) {
        return nhanVienRepository.findById(id).get();
    }

    @Override
    public NhanVien save(NhanVien emp) {
        return nhanVienRepository.save(emp);
    }

    @Override
    public void deleteById(String id) {
        nhanVienRepository.deleteById(id);
    }

    @Override
    public Page<NhanVien> findByKeyword(String keyword, Pageable pageable) {
        return nhanVienRepository.findByKeyword(keyword, pageable);
    }
}
