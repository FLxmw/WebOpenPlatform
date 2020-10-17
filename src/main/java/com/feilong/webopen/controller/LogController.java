package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Log;
import com.feilong.webopen.service.LogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 18:21
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logService;


    @RequestMapping("/showTable")
    public TableData<Log> showTable(int page, int limit) {
        PageInfo<Log> logListByPage = null;
        try {
            logListByPage = logService.getLogListByPage(page, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new TableData<>(logListByPage.getTotal(), logListByPage.getList());
    }

    @PostMapping("/addLog")
    public AjaxMessage addLog(Log log, HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        log.setIp(ip);
        try {
            logService.insertLog(log);
            return new AjaxMessage(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "添加失败！");
        }
    }
}
