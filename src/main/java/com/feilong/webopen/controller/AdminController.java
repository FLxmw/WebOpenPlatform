package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.entity.Admin;
import com.feilong.webopen.entity.Token;
import com.feilong.webopen.service.AdminService;
import com.feilong.webopen.service.TokenService;
import com.feilong.webopen.utils.JwtUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

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
    @Autowired
    private TokenService tokenService;

    @RequestMapping("/login")
    private AjaxMessage adminLogin(Admin admin) {
        System.out.println(admin);
        Admin loginAdmin = null;
        try {
            loginAdmin = adminService.selectAdmin(admin.getUsername(), admin.getPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(loginAdmin);
        if (loginAdmin != null) {
            String accessToken = JwtUtil.sign(loginAdmin.getUsername(), loginAdmin.getPassword());
            String str = accessToken.replace(".", ",");
            System.out.println(str);
            String[] split = str.split(",");
            String strValue = split[split.length - 1];
            Token token = new Token();
            token.setAccessToken(strValue);
            token.setAid(loginAdmin.getId());
            //开始时间  为用户登录的当前时间
            token.setStartTime(new Date());
            long l = System.currentTimeMillis();
            //过期时间  一天
            token.setExpireTime(new Date(l + JwtUtil.EXPIRE_TIME));
            System.out.println(token);
            try {
                tokenService.insertToken(token);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new AjaxMessage(true, "登录成功！", accessToken);
        }
        return new AjaxMessage(false, "登录失败，请检查用户名或密码是否有误！");
    }
}
