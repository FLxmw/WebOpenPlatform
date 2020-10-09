package com.feilong.webopen.service;

import com.feilong.webopen.entity.AppInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/8 16:13
 */
@SuppressWarnings("ALL")
public interface AppInfoService {
    void insertAppInfo(AppInfo appInfo);

    void updateAppInfo(AppInfo appInfo);

    void deleteAppInfoByIds(long[] ids);

    AppInfo getAppInfoById(int id);

    List<AppInfo> getAppInfos();

    PageInfo<AppInfo> findAllAppInfosByPage(int page,int limit);
}
