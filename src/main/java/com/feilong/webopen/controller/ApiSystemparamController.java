package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.entity.ApiSystemparam;
import com.feilong.webopen.service.ApiSystemparamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 16:52
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/apiSysParam")
public class ApiSystemparamController {
    @Autowired
    private ApiSystemparamService apiSystemparamService;

    @RequestMapping("/getApiSystemparam")
    public ApiSystemparam getApiSystemparam() {
        System.out.println("2222");
        try {
            ApiSystemparam apiSystemparam = apiSystemparamService.getApiSystemparamById();
            return apiSystemparam;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @PostMapping("/updateApiSystemparam")
    public AjaxMessage updateApiSystemparam(ApiSystemparam apiSystemparam){
        System.out.println(apiSystemparam);
        try {
            apiSystemparamService.updateApiSystemparam(apiSystemparam);
            return new AjaxMessage(true,"系统基本参数修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false,"系统基本参数修改失败！");
        }
    }

}
