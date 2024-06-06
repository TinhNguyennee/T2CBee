package com.T2CBee.service;

import com.T2CBee.entity.AnhSanPham;
import com.T2CBee.entity.BinhLuan;
import com.T2CBee.entity.SanPham;
import com.T2CBee.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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
    public List<AnhSanPham> findAllPictureByGroupId(String groupId) {
        return dao.findAllPictureByGroupId(groupId);
    }

    @Override
    public Double findMinPriceByGroupId(String groupId) {
        return dao.findMinPriceByGroupId(groupId) == null ? 0.0 : dao.findMinPriceByGroupId(groupId);
    }

    @Override
    public Double findMaxPriceByGroupId(String groupId) {
        return dao.findMaxPriceByGroupId(groupId);
    }

    @Override
    public List<String> findDistinctPhanLoaiByGroupId(String groupId) {
        return dao.findDistinctPhanLoaiByGroupId(groupId);
    }

    @Override
    public Integer countTotalReviewsByGroupId(String groupId) {
        return dao.countTotalReviewsByGroupId(groupId);
    }

    public List<BinhLuan> findAllBinhLuanByGroupId(String groupId) {
        return dao.findAllBinhLuanByGroupId(groupId);
    }

    @Override
    public List<String> findDanhMucNamesByGroupId(String groupId) {
        // TODO Auto-generated method stub
        return dao.findDanhMucNamesByGroupId(groupId);
    }

    @Override
    public SanPham findSanPhamByPhanLoaiAndGroup(String groupId, Optional<String> productType) {
        // TODO Auto-generated method stub
        return dao.findSanPhamByPhanLoaiAndGroup(groupId, productType);
    }
    @Override
    public Double findAverageRatingByGroupId(String groupId) {
        Double averageRating = dao.findAverageRatingByGroupId(groupId);
        if (averageRating == null) {
            return 0.0; // Trả về 0 nếu không có bình luận nào
        }
        return Math.ceil(averageRating); // Làm tròn lên giá trị trung bình
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
    public Page<SanPham> findByDanhMucAndGiaBetween(String danhMuc, double minPrice, double maxPrice,
                                                    Pageable pageable) {
        return dao.findByDanhMucAndGiaBanBetween(danhMuc, minPrice, maxPrice, pageable);
    }

    @Override
    public Page<SanPham> findByPriceBetween(double minPrice, double maxPrice, Pageable pageable) {
        return dao.findByGiaBanBetween(minPrice, maxPrice, pageable);
    }

    @Override
    public int countByDanhMuc(String tenDanhMuc) {
        return dao.countByDanhMuc(tenDanhMuc);
    }

    @Override
    public int countAllSanPham() {
        return dao.countAllSanPham();
    }

    @Override
    public List<AnhSanPham> findPictureBySanPhamId(Integer id) {
        return dao.findPictureBySanPhamId(id);
    }

}
