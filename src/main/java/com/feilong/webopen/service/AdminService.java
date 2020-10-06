package com.feilong.webopen.service;

import com.feilong.webopen.entity.Admin;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:12
 */
@SuppressWarnings("ALL")
public interface AdminService {
    Admin selectAdmin(String username, String password);
}
