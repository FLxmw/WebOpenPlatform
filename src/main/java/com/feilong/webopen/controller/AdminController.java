package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.entity.Admin;
import com.feilong.webopen.service.AdminService;
import com.feilong.webopen.utils.JwtUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:01
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    private  AjaxMessage adminLogin(Admin admin) {
        System.out.println(admin);
        Admin loginAdmin = null;
        try {
            loginAdmin = adminService.selectAdmin(admin.getUsername(), admin.getPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(loginAdmin);
        if (loginAdmin != null) {
            String token = JwtUtil.sign(loginAdmin.getUsername(), loginAdmin.getPassword());
            return new AjaxMessage(true, "登录成功！",token);
        }
        return new AjaxMessage(false, "登录失败，请检查用户名或密码是否有误！");
    }
}
