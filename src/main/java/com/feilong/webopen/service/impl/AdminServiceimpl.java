package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Admin;
import com.feilong.webopen.mapper.AdminMapper;
import com.feilong.webopen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:13
 */
@SuppressWarnings("ALL")
@Service("adminService")
public class AdminServiceimpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin selectAdmin(String username, String password) {
        Admin admin = adminMapper.selectAdmin(username, password);
        return admin;
    }
}
