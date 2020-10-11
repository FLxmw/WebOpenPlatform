package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Navs;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 20:58
 */
@SuppressWarnings("ALL")
@Repository
public interface NavsMapper {
    List<Navs> getAllNavs();

    List<Navs> getNavsList(@Param("pid") int pid);
}
