package com.feilong.webopen.service;

import com.feilong.webopen.entity.ApiMapping;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/8 16:13
 */
@SuppressWarnings("ALL")
public interface ApiMappingService {
    void insertApiMapping(ApiMapping mapping);

    void updateApiMapping(ApiMapping mapping);

    void deleteApiMappingByIds(long[] ids);

    List<ApiMapping> getMappingList();

    ApiMapping getMappingById(Integer id);

    PageInfo<ApiMapping> findAllApiMappingsByPage(int page, int limit);
}
