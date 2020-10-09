package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.ApiMapping;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 13:37
 */
@SuppressWarnings("ALL")
@Repository
public interface ApiMappingMapper {
    void insertApiMapping(ApiMapping mapping);

    void updateApiMapping(ApiMapping mapping);

    void deleteApiMappingByIds(long[] ids);

    List<ApiMapping> getMappingList();

    ApiMapping getMappingById(Integer id);
}
