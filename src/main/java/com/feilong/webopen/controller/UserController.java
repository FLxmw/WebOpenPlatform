package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.User;
import com.feilong.webopen.entity.Token;
import com.feilong.webopen.service.UserService;
import com.feilong.webopen.service.TokenService;
import com.feilong.webopen.utils.Base64Utils;
import com.feilong.webopen.utils.JwtUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:01
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;

    @RequestMapping("/login")
    public AjaxMessage userLogin(User user) {
        System.out.println(user);
        String encodePassword = Base64Utils.encode(user.getPassword());
        User loginUser = null;
        try {
            loginUser = userService.selectUser(user.getUsername(), encodePassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(loginUser);
        if (loginUser != null) {
            String accessToken = JwtUtil.sign(loginUser.getUsername(), loginUser.getPassword());
            String str = accessToken.replace(".", ",");
            System.out.println(str);
            String[] split = str.split(",");
            String strValue = split[split.length - 1];
            Token token = new Token();
            token.setAccessToken(strValue);
            token.setAid(loginUser.getId());
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

    @RequestMapping("/showTable")
    public TableData<User> showusers(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int limit) {
        TableData tableData = new TableData();
        PageInfo<User> users = null;
        try {
            users = userService.findAllusers(page, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        tableData.setCode(0);
        tableData.setMsg("成功!");
        tableData.setCount(users.getTotal());
        tableData.setData(users.getList());
        return tableData;
    }

    @PostMapping("/addUser")
    public AjaxMessage addUser(User user) {
        //自动设置添加时间 为当前时间
        user.setEndtime(new Date());
        String password = user.getPassword();
        String encodePassword = Base64Utils.encode(password);
        user.setPassword(encodePassword);
        try {
            userService.insertUser(user);
            return new AjaxMessage(true, "添加用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "添加用户失败！");
        }
    }

    @PostMapping("/updateUser")
    public AjaxMessage updateUser(User user) {
        try {
            String password = user.getPassword();
            String encodePassword = Base64Utils.encode(password);
            user.setPassword(encodePassword);
            userService.updateUserById(user);
            return new AjaxMessage(true, "修改用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "修改用户失败！");
        }
    }

    @GetMapping("/deleteUser")
    public AjaxMessage deleteUser(long[] ids) {
        System.out.println(ids);
        try {
            userService.deleteUserByIds(ids);
            return new AjaxMessage(true, "删除用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "删除用户失败！");
        }
    }
}
