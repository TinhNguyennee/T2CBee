package com.T2CBee.util;

import java.util.ArrayList;
import java.util.List;

public class BreadcrumbUtil {

    public static List<Object> addBreadcrumb(String title, String url, List<Object> breadcrumbs) {
        breadcrumbs.add(new String[]{title, url});
        return breadcrumbs;
    }

    public static List<Object> createBreadcrumbList() {
        return new ArrayList<>();
    }
}