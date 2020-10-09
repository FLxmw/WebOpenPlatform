package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.ApiSystemparam;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 16:37
 */
@SuppressWarnings("ALL")
public interface ApiSystemparamMapper {
    ApiSystemparam getApiSystemparamById();

    void updateApiSystemparam(ApiSystemparam apiSystemparam);
}
