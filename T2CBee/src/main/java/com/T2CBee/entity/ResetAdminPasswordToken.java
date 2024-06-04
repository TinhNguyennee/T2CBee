package com.T2CBee.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class ResetAdminPasswordToken {
    private String id;
    private NhanVien nhanVien;
}
