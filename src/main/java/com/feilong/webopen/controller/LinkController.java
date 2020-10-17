package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Link;
import com.feilong.webopen.service.LinkService;
import com.github.pagehelper.PageInfo;
import jdk.nashorn.api.scripting.AbstractJSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 14:14
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/link")
public class LinkController {
    @Autowired
    private LinkService linkService;

    @RequestMapping("/showTable")
    public TableData<Link> showTable(int page, int limit) {
        TableData<Link> linkTableData = new TableData<>();
        PageInfo<Link> linkByPage = null;
        try {
            linkByPage = linkService.getLinkByPage(page, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new TableData<>(linkByPage.getTotal(), linkByPage.getList());
    }

    @RequestMapping("/deleteLink")
    public AjaxMessage deleteLink(long[] ids) {
        try {
            linkService.deleteLinkByIds(ids);
            return new AjaxMessage(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "删除失败！");

        }
    }

    @PostMapping("/addLink")
    public AjaxMessage addLink(Link link) {
        System.out.println(link);
        try {
            linkService.insertLink(link);
            return new AjaxMessage(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "添加失败！");
        }
    }

    @PostMapping("/updateLink")
    public AjaxMessage updateLink(Link link) {
        System.out.println(link);
        try {
            linkService.updateLink(link);
            return new AjaxMessage(true, "修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "修改失败！");
        }
    }
}
