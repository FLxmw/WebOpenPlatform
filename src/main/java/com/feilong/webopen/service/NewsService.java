package com.feilong.webopen.service;

import com.feilong.webopen.entity.News;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 19:41
 */
@SuppressWarnings("ALL")
public interface NewsService {
    List<News> getNewsList();

    void insertNews(News news);

    void updateNews(News news);

    void deleteNewsByIds(long[] ids);

    PageInfo<News> getNewsListByPage(int page, int limit);

    String findContentById(Integer id);
}
