package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.entity.Admin;
import com.feilong.webopen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("/login")
    private AjaxMessage adminLogin(Admin admin) {
        Admin loginAdmin = adminService.selectAdmin(admin.getUsername(), admin.getPassword());
        if (loginAdmin != null) {
            return new AjaxMessage(true, "登录成功！");
        }
        return new AjaxMessage(false, "登录失败，请检查用户名或密码是否有误！");
    }
}
