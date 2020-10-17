package com.feilong.webopen.service;

import com.feilong.webopen.entity.Link;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 14:00
 */
@SuppressWarnings("ALL")
public interface LinkService {
    void insertLink(Link link);

    void updateLink(Link link);

    void deleteLinkByIds(long[] ids);

    PageInfo<Link> getLinkByPage(int page,int limit);
}
