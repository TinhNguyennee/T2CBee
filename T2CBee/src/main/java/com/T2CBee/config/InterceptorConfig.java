package com.T2CBee.config;

import com.T2CBee.interceptor.AdminAuthInterceptor;
import com.T2CBee.interceptor.UserAuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    AdminAuthInterceptor adminAuth;

    @Autowired
    UserAuthInterceptor userAuth;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminAuth)
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/dang-nhap", "/admin/quen-mat-khau", "/admin/thay-doi-mat-khau");
        registry.addInterceptor(userAuth)
                .addPathPatterns("/thong-tin","/don-hang-cua-toi","/danh-sach-yeu-thich","/tai-khoan-chi-tiet","/so-dia-chi")
                .excludePathPatterns("/admin/dang-nhap", "/admin/quen-mat-khau");
    }
}
