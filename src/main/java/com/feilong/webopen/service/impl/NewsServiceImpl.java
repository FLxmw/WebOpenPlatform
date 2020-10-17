package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.News;
import com.feilong.webopen.mapper.NewsMapper;
import com.feilong.webopen.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 19:42
 */
@SuppressWarnings("ALL")
@Service("newsService")
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<News> getNewsList() {
        return newsMapper.getNewsList();
    }

    @Override
    public void insertNews(News news) {
        newsMapper.insertNews(news);
    }

    @Override
    public void updateNews(News news) {
        newsMapper.updateNews(news);
    }

    @Override
    public void deleteNewsByIds(long[] ids) {
        if (ids != null && ids.length > 0) {
            newsMapper.deleteNewsByIds(ids);
        }
    }

    @Override
    public PageInfo<News> getNewsListByPage(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<News> newsList = newsMapper.getNewsList();
        return new PageInfo<News>(newsList);
    }

    @Override
    public String findContentById(Integer id) {
        return newsMapper.findContentById(id);
    }
}
