package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.AppInfo;
import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.service.AppInfoService;
import com.feilong.webopen.service.CustomerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/8 16:45
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/appInfo")
public class AppInfoController {
    @Autowired
    private AppInfoService appInfoService;
    @Autowired
    private CustomerService customerService;

    @PostMapping("/addAppInfo")
    public AjaxMessage addAppInfo(AppInfo appInfo) {
        try {
            appInfoService.insertAppInfo(appInfo);
            return new AjaxMessage(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "添加失败！");
        }
    }

    @PostMapping("/updateAppInfo")
    public AjaxMessage updateAppInfo(AppInfo appInfo) {
        try {
            appInfoService.updateAppInfo(appInfo);
            return new AjaxMessage(true, "修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "修改失败！");
        }
    }

    @RequestMapping("/deleteAppInfo")
    public AjaxMessage deleteAppInfo(long[] ids) {
        System.out.println(ids);
        try {
            appInfoService.deleteAppInfoByIds(ids);
            return new AjaxMessage(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "删除失败！");
        }
    }

    @RequestMapping("/showTable")
    public TableData<AppInfo> getAllAppInfo(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "2") int limit) {
        TableData<AppInfo> tableData = new TableData<>();
        PageInfo<AppInfo> pageInfo = appInfoService.findAllAppInfosByPage(page, limit);
        tableData.setCount(pageInfo.getTotal());
        tableData.setData(pageInfo.getList());
        tableData.setMsg("查找成功！");
        return tableData;
    }

    @RequestMapping("/getAppInfo")
    public AppInfo getAppInfo(int id) {
        AppInfo appInfo = appInfoService.getAppInfoById(id);
        return appInfo;
    }

    @RequestMapping("/getCustomers")
    public List<Customer> getCustomers(){
        List<Customer> customers = customerService.getAllCustomers();
        return customers;
    }
}
