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

import javax.servlet.http.HttpServletRequest;
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

    @PostMapping("/checkUser")
    public int checkUser(String username) {
        System.out.println(username);
        try {
            User user = userService.findUserByUsername(username);
            //不为空不能注册  1
            if (user != null) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @RequestMapping("/login")
    public AjaxMessage userLogin(String username, String password,HttpServletRequest request) {
        request.getSession().setAttribute("username",username);
        String encodePassword = Base64Utils.encode(password);
        User loginUser = null;
        try {
            loginUser = userService.selectUser(username, encodePassword);
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

    @RequestMapping("/checkCode")
    public AjaxMessage checkCode(String code, HttpServletRequest request) {
        String sessionCode = (String) request.getSession().getAttribute("code");
        if (code != null && sessionCode != null && code.equals(sessionCode)) {
            return new AjaxMessage(true, "验证码正确！");
        }
        return new AjaxMessage(false, "验证码输入有误，请重新输入");
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
    public AjaxMessage addUser(User user, @RequestParam(name = "message") String message, HttpServletRequest request) {
        String session_message = (String) request.getSession().getAttribute("message");
        System.out.println(session_message.equals(message));
        if (message != null && session_message != null && session_message.equals(message)) {
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
        return new AjaxMessage(false, "验证码有误，请重新输入！");

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
