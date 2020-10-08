package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.AppInfo;
import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.mapper.AppInfoMapper;
import com.feilong.webopen.mapper.CustomerMapper;
import com.feilong.webopen.service.AppInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/8 16:15
 */
@SuppressWarnings("ALL")
@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {
    @Autowired
    private AppInfoMapper appInfoMapper;
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public void insertAppInfo(AppInfo appInfo) {
        //先查询我们的客户，然后将名字设置给我们的应用名称
        Customer customer = customerMapper.findCustomerById(appInfo.getCusId());
        appInfo.setCorpName(customer == null ? null : customer.getNickname());
        appInfoMapper.insertAppInfo(appInfo);
    }

    @Override
    public void updateAppInfo(AppInfo appInfo) {
        if (appInfo.getId() != null) {
            //更新冗余字段，公司名称
            Customer customer = customerMapper.findCustomerById(appInfo.getCusId());
            if (customer != null) {
                appInfo.setCorpName(customer.getNickname());
            }
            appInfoMapper.updateAppInfo(appInfo);
        }
    }

    @Override
    public void deleteAppInfoByIds(long[] ids) {
        if (ids != null && ids.length > 0) {
            appInfoMapper.deleteAppInfoByIds(ids);
        }
    }

    @Override
    public AppInfo getAppInfoById(int id) {
        AppInfo appInfo= appInfoMapper.getAppInfoById(id);
        return appInfo;
    }

    @Override
    public List<AppInfo> getAppInfos() {
        List<AppInfo> appInfos = appInfoMapper.getAppInfos();
        return appInfos;
    }

    @Override
    public PageInfo<AppInfo> findAllAppInfosByPage( int page, int limit) {
        PageHelper.startPage(page,limit);
        List<AppInfo> appInfos = appInfoMapper.getAppInfos();
        return new PageInfo<AppInfo>(appInfos);
    }


}
