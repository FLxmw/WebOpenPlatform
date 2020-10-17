package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Log;
import com.feilong.webopen.mapper.LogMapper;
import com.feilong.webopen.service.LogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 18:20
 */
@SuppressWarnings("ALL")
@Service("/logService")
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public void insertLog(Log log) {
        logMapper.insertLog(log);
    }

    @Override
    public PageInfo<Log> getLogListByPage(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Log> logList = logMapper.getLogList();
        return new PageInfo<Log>(logList);
    }
}
