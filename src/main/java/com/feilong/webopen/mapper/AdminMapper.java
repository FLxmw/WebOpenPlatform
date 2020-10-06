package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Admin;
import org.springframework.stereotype.Repository;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:07
 */
@SuppressWarnings("ALL")
@Repository
public interface AdminMapper {
    Admin selectAdmin(String username,String password);
}
