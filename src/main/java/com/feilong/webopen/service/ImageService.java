package com.feilong.webopen.service;

import com.feilong.webopen.entity.Image;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 8:24
 */
@SuppressWarnings("ALL")
public interface ImageService {
    PageInfo<Image> getImagesByPage(int page, int limit);
}
