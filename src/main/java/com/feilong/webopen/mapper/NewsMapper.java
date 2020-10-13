package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.News;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 19:23
 */
@SuppressWarnings("ALL")
public interface NewsMapper {
    List<News> getNewsList();

    void insertNews(News news);

    void updateNews(News news);

    void deleteNewsByIds(long[] ids);
}
