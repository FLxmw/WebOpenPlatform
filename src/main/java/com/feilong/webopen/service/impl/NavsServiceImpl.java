package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Navs;
import com.feilong.webopen.mapper.NavsMapper;
import com.feilong.webopen.service.NavsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 21:02
 */
@SuppressWarnings("ALL")
@Service
public class NavsServiceImpl implements NavsService {
    @Autowired
    private NavsMapper navsMapper;
    @Override
    public List<Navs> getNavsList(int pid) {
        List<Navs> navsList = navsMapper.getNavsList(pid);
        return navsList;
    }

    @Override
    public List<Navs> getAllNavs() {
        return navsMapper.getAllNavs();
    }
}
