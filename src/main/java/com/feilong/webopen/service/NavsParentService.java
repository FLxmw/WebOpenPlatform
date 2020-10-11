package com.feilong.webopen.service;

import com.feilong.webopen.entity.NavsParent;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 21:25
 */
@SuppressWarnings("ALL")
public interface NavsParentService {
    NavsParent getNavsParentById();

   List<NavsParent> getNavsParentList();
}
