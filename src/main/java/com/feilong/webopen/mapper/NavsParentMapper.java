package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.NavsParent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 21:23
 */
@SuppressWarnings("ALL")
public interface NavsParentMapper {

    NavsParent getNavsParentById(@Param("id") int id);

    List<NavsParent> getNavsParentList();
}
