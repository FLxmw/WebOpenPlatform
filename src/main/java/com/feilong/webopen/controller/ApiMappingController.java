package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.ApiMapping;
import com.feilong.webopen.service.ApiMappingService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 14:19
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/apiMapping")
public class ApiMappingController {
    @Autowired
    private ApiMappingService apiMappingService;

    @PostMapping("/addApiMapping")
    public AjaxMessage addApiMapping(ApiMapping apiMapping) {
        try {
            apiMappingService.insertApiMapping(apiMapping);
            return new AjaxMessage(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "添加失败！");
        }
    }

    @PostMapping("/updateApiMapping")
    public AjaxMessage updateApiMapping(ApiMapping apiMapping) {
        try {
            apiMappingService.updateApiMapping(apiMapping);
            return new AjaxMessage(true, "修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "修改失败！");
        }
    }

    @RequestMapping("/deleteApiMapping")
    public AjaxMessage deleteApiMapping(long[] ids) {
        try {
            apiMappingService.deleteApiMappingByIds(ids);
            return new AjaxMessage(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "删除失败！");
        }
    }

    @RequestMapping("/showTable")
    public TableData<ApiMapping> getMappings(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "3") int limit) {
        TableData<ApiMapping> tableData = new TableData<>();
        PageInfo<ApiMapping> pageInfo = apiMappingService.findAllApiMappingsByPage(page, limit);
        tableData.setMsg("查找成功！");
        tableData.setData(pageInfo.getList());
        tableData.setCount(pageInfo.getTotal());
        return tableData;
    }

    @RequestMapping("/getMapping")
    public ApiMapping getMappingById(int id) {
        return apiMappingService.getMappingById(id);
    }
}
