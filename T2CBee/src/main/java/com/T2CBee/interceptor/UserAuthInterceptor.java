package com.T2CBee.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.T2CBee.entity.NhanVien;
import com.T2CBee.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class UserAuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
			String uri = request.getRequestURI();
			NhanVien user = session.get("user"); // lấy từ session
			String error = "";
			
			
			if(user == null) { // chưa đăng nhập
			error = "Please login!";
			response.sendRedirect("/dang-nhap?error=" + error);
			}else		
			// không đúng vai trò
			if(!user.isChucVu() && uri.startsWith("/admin/")) {
			error = "Access denied!";
			response.sendRedirect("/dang-nhap?error=" + error);
			}
			
			return true;
			
	}
}
