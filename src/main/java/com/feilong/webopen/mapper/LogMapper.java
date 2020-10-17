package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Log;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 18:14
 */
@SuppressWarnings("ALL")
@Repository
public interface LogMapper {
    void insertLog(Log log);

    List<Log> getLogList();
}
