package com.feilong.webopen.service;

import com.feilong.webopen.entity.ApiSystemparam;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 16:48
 */
@SuppressWarnings("ALL")
public interface ApiSystemparamService {

    ApiSystemparam getApiSystemparamById();

    void updateApiSystemparam(ApiSystemparam apiSystemparam);
}
