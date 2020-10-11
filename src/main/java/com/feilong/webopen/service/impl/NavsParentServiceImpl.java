package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Navs;
import com.feilong.webopen.entity.NavsBeans;
import com.feilong.webopen.entity.NavsParent;
import com.feilong.webopen.mapper.NavsMapper;
import com.feilong.webopen.mapper.NavsParentMapper;
import com.feilong.webopen.service.NavsParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 21:25
 */
@SuppressWarnings("ALL")
@Service
public class NavsParentServiceImpl implements NavsParentService {
    @Autowired
    private NavsParentMapper navsParentMapper;


    @Override
    public NavsParent getNavsParentById() {
        return null;
    }

    @Override
    public List<NavsParent> getNavsParentList() {
        return navsParentMapper.getNavsParentList();
    }
}
