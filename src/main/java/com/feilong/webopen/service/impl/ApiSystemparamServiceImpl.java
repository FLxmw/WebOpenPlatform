package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.ApiSystemparam;
import com.feilong.webopen.mapper.ApiSystemparamMapper;
import com.feilong.webopen.service.ApiSystemparamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 16:49
 */
@SuppressWarnings("ALL")
@Service
public class ApiSystemparamServiceImpl implements ApiSystemparamService {
    @Autowired
    private ApiSystemparamMapper apiSystemparamMapper;
    @Override
    public ApiSystemparam getApiSystemparamById() {
            return apiSystemparamMapper.getApiSystemparamById();
    }

    @Override
    public void updateApiSystemparam(ApiSystemparam apiSystemparam) {
        apiSystemparamMapper.updateApiSystemparam(apiSystemparam);
    }
}
