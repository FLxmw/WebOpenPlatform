package com.feilong.webopen.service;


import com.feilong.webopen.entity.User;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:12
 */
@SuppressWarnings("ALL")
public interface UserService {
    User selectUser(String username, String password);

    PageInfo<User> findAllusers(int page, int limit);
}
