package com.feilong.webopen.service;

import com.feilong.webopen.entity.Navs;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 21:02
 */
@SuppressWarnings("ALL")
public interface NavsService {

    List<Navs> getNavsList(int pid);

    List<Navs> getAllNavs();
}
