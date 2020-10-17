package com.feilong.webopen.service;

import com.feilong.webopen.entity.Log;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 18:19
 */
@SuppressWarnings("ALL")
public interface LogService {
    void insertLog(Log log);

    PageInfo<Log> getLogListByPage(int page, int limit);
}
