package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.ApiMapping;
import com.feilong.webopen.mapper.ApiMappingMapper;
import com.feilong.webopen.service.ApiMappingService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 14:06
 */
@SuppressWarnings("ALL")
@Service
public class ApiMappingServiceImpl implements ApiMappingService {
    @Autowired
    private ApiMappingMapper apiMappingMapper;

    @Override
    public void insertApiMapping(ApiMapping mapping) {
        apiMappingMapper.insertApiMapping(mapping);
    }

    @Override
    public void updateApiMapping(ApiMapping mapping) {
        apiMappingMapper.updateApiMapping(mapping);
    }

    @Override
    public void deleteApiMappingByIds(long[] ids) {
        if (ids == null || ids.length == 0) {
            return;
        }
        apiMappingMapper.deleteApiMappingByIds(ids);
    }

    @Override
    public List<ApiMapping> getMappingList() {
        return apiMappingMapper.getMappingList();
    }

    @Override
    public ApiMapping getMappingById(Integer id) {
        if (id == null) {
            return null;
        }
        return apiMappingMapper.getMappingById(id);
    }

    @Override
    public PageInfo<ApiMapping> findAllApiMappingsByPage(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<ApiMapping> apiMappingList = apiMappingMapper.getMappingList();
        return new PageInfo<ApiMapping>(apiMappingList);
    }
}
