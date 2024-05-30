package com.T2CBee.service;

import com.T2CBee.entity.BinhLuan;
import com.T2CBee.repository.BinhLuanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BinhLuanServiceImpl implements BinhLuanService{

    @Autowired
    private BinhLuanRepository dao;

    @Override
    public List<BinhLuan> findAll() {
        return dao.findAll();
    }

    @Override
    public Page<BinhLuan> findAll(Pageable pageable) {
        return dao.findAll(pageable);
    }

    @Override
    public BinhLuan findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public Page<BinhLuan> findByKeyword(String keyword, Pageable pageable) {
        return dao.findByKeyword(keyword, pageable);
    }

    @Override
    public BinhLuan save(BinhLuan emp) {
        return dao.save(emp);
    }

    @Override
    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    @Override
    public Page<BinhLuan> findRepotedComment(Pageable pageable) {
        return dao.findRepotedComment(pageable);
    }

    @Override
    public Page<BinhLuan> findByRating(Short rating, Pageable pageable) {
        return dao.findByRating(rating, pageable);
    }
}
