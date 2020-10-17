package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Link;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 13:42
 */
@SuppressWarnings("ALL")
@Repository
public interface LinkMapper {
    void insertLink(Link link);

    void updateLink(Link link);

    void deleteLinkByIds(long[] ids);

    List<Link> getLinkList();
}
