package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.User;
import com.feilong.webopen.mapper.UserMapper;
import com.feilong.webopen.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:13
 */
@SuppressWarnings("ALL")
@Service("UserService")
public class UserServiceimpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public void updateUserById(User user) {
        userMapper.updateUserById(user);
    }

    @Override
    public void deleteUserByIds(long[] ids) {
        if (ids != null && ids.length > 0) {
            userMapper.deleteUserByIds(ids);
        }
    }

    @Override
    public User selectUser(String username, String password) {
        User User = userMapper.selectUser(username, password);
        return User;
    }

    @Override
    public PageInfo<User> findAllusers(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<User> userList = userMapper.getUserList();
        return new PageInfo<User>(userList);
    }

    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }
}
