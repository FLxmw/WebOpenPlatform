package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Recharge;
import com.feilong.webopen.service.RechargeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 15:29
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/recharge")
public class RechargeController {
    @Autowired
    private RechargeService rechargeService;

    @PostMapping("/addRecharge")
    public AjaxMessage addRecharge(Recharge recharge) {
        try {
            rechargeService.insertRecharge(recharge);
            return new AjaxMessage(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "添加失败！");
        }
    }

    @PostMapping("/updateRecharge")
    public AjaxMessage updateRecharge(Recharge recharge) {
        try {
            rechargeService.updateRecharge(recharge);
            return new AjaxMessage(true, "修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "修改失败！");
        }
    }

    @RequestMapping("/deleteRecharge")
    public AjaxMessage deleteRecharge(long[] ids) {
        try {
            rechargeService.deleteRechargeByIds(ids);
            return new AjaxMessage(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "删除失败！");
        }
    }

    @RequestMapping("/showTable")
    public TableData<Recharge> getRechargeList(int page, int limit,Recharge recharge) {
        TableData<Recharge> tableData = new TableData<>();
        PageInfo<Recharge> pageInfo = rechargeService.getRechargeListByPage(page, limit,recharge);
        return new TableData<Recharge>(pageInfo.getTotal(), pageInfo.getList());
    }

}
