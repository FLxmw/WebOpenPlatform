package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.ContentData;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.News;
import com.feilong.webopen.service.NewsService;
import com.github.pagehelper.PageInfo;
import jdk.nashorn.api.scripting.AbstractJSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 19:21
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    @RequestMapping("/showTable")
    public TableData<News> showTable(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int limit) {
        TableData<News> newsTableData = new TableData<>();
        PageInfo<News> newsListByPage = newsService.getNewsListByPage(page, limit);
        return new TableData(newsListByPage.getTotal(), newsListByPage.getList());
    }

    @PostMapping("/addNews")
    public AjaxMessage addNews(News news) {
        System.out.println(news);
        try {
            newsService.insertNews(news);
            return new AjaxMessage(true, "文章添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "文章添加失败！图片不能为空！");
        }
    }


    @PostMapping("/updateNews")
    public AjaxMessage updateNews(News news) {
        System.out.println(news);
        try {
            newsService.updateNews(news);
            return new AjaxMessage(true, "文章修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "文章修改失败！图片不能为空");
        }
    }

    @RequestMapping("/deleteNews")
    public AjaxMessage deleteNews(long[] ids) {
        System.out.println(ids);
        try {
            newsService.deleteNewsByIds(ids);
            return new AjaxMessage(true, "文章删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "文章删除失败！");
        }
    }

    @RequestMapping("/showContent")
    public ContentData showContent(Integer id) {
        System.out.println(id);
        String content = null;
        try {
            content = newsService.findContentById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ContentData(content);
    }
}
