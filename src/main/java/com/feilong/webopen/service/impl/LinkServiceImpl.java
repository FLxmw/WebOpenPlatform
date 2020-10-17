package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Link;
import com.feilong.webopen.mapper.LinkMapper;
import com.feilong.webopen.service.LinkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 14:02
 */
@SuppressWarnings("ALL")
@Service("linkService")
public class LinkServiceImpl implements LinkService {
    @Autowired
    private LinkMapper linkMapper;

    @Override
    public void insertLink(Link link) {
        linkMapper.insertLink(link);
    }

    @Override
    public void updateLink(Link link) {
        linkMapper.updateLink(link);
    }

    @Override
    public void deleteLinkByIds(long[] ids) {
        if (ids.length > 0 && ids != null) {
            linkMapper.deleteLinkByIds(ids);
        }
    }

    @Override
    public PageInfo<Link> getLinkByPage(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Link> linkList = linkMapper.getLinkList();
        return new PageInfo<Link>(linkList);
    }
}
