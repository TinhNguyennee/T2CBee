package com.T2CBee.interceptor;

import com.T2CBee.entity.NhanVien;
import com.T2CBee.service.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

@Service
public class AdminAuthInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String uri = request.getRequestURI();
        System.out.println(uri);
        NhanVien nv = session.get("nhanVien");

        if(nv == null) { // chưa đăng nhập
            response.sendRedirect("/admin/dang-nhap");
            return false; //chặn không cho qua controller
        } else if(!nv.isChucVu() && uri.contains("/delete")) { //không cho nhân viên xóa
            request.setAttribute("systemError", "Bạn không có quyền xóa!");
            request.getRequestDispatcher(uri.replace("/delete", "")).forward(request, response);
            return false; //chặn không cho qua controller để delete
        }

        return true;
    }
}
