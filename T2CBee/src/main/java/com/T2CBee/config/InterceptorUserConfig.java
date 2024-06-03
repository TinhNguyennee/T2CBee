package com.T2CBee.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.T2CBee.interceptor.UserAuthInterceptor;

@Configuration
public class InterceptorUserConfig implements WebMvcConfigurer {

    @Autowired
    UserAuthInterceptor auth;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(auth)
                .addPathPatterns("/admin/**","/thong-tin","/don-hang-cua-toi","/danh-sach-yeu-thich","/tai-khoan-chi-tiet","/so-dia-chi")
                .excludePathPatterns("/admin/dang-nhap", "/admin/quen-mat-khau");
    }
}
