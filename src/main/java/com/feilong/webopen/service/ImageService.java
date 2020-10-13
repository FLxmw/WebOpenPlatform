package com.feilong.webopen.service;

import com.feilong.webopen.entity.Image;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 8:24
 */
@SuppressWarnings("ALL")
public interface ImageService {
    List<Image> getImageList();

    PageInfo<Image> getImagesByPage(int page, int limit);

    void insertImage(Image image);

    void deleteImageByIds(long[] ids);
}
