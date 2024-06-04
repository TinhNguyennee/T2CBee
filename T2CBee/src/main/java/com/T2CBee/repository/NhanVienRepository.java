package com.T2CBee.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.T2CBee.entity.NhanVien;

public interface NhanVienRepository extends JpaRepository<NhanVien, String> {
    @Query("SELECT e FROM NhanVien e WHERE " +
            "e.id LIKE %:keyword% " +
            "OR e.hoTen LIKE %:keyword% " +
            "OR e.email LIKE %:keyword% " +
            "OR e.diaChi LIKE %:keyword% ")
    Page<NhanVien> findByKeyword(@Param("keyword") String keyword, Pageable pageable);


    @Query("SELECT e FROM NhanVien e WHERE e.email = :email")
    NhanVien findByEmail(@Param("email") String email);
}
