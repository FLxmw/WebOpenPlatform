package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.AppInfo;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/8 15:54
 */
@SuppressWarnings("ALL")
@Repository
public interface AppInfoMapper {
    void insertAppInfo(AppInfo appInfo);

    void updateAppInfo(AppInfo appInfo);

//    void deleteAppInfoById(int id);

    void deleteAppInfoByIds(long[] ids);

    AppInfo getAppInfoById(int id);

    List<AppInfo> getAppInfos();
}
