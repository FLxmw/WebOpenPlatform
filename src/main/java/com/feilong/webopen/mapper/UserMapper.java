package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:07
 */
@SuppressWarnings("ALL")
@Repository
public interface UserMapper {
    void insertUser(User user);

    void updateUserById(User user);

    void deleteUserByIds(long[] ids);

    User selectUser(@Param("username") String username, @Param("password") String password);

    List<User> getUserList();

    User findUserByUsername(@Param("username") String username);

    void updatePassword(@Param("id") Integer id, @Param("password") String encodePwd);
}
