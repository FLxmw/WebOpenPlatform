package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Image;
import com.feilong.webopen.mapper.ImageMapper;
import com.feilong.webopen.service.ImageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 8:25
 */
@SuppressWarnings("ALL")
@Service("imageService")
public class ImageServiceImpl implements ImageService {
    @Autowired
    private ImageMapper imageMapper;

    @Override
    public PageInfo<Image> getImagesByPage(int page, int limit) {
        System.out.println(page + "=====" + limit);
        System.out.println(imageMapper);
        PageHelper.startPage(page, limit);
        List<Image> imageList = imageMapper.getImageList();
        return new PageInfo<Image>(imageList);
    }
}
