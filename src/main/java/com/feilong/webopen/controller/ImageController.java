package com.feilong.webopen.controller;

import com.feilong.webopen.bean.ImageData;
import com.feilong.webopen.entity.Image;
import com.feilong.webopen.service.ImageService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/12 23:04
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/image")
public class ImageController {
    @Autowired
    private ImageService imageService;

    @RequestMapping("/showImages")
    public ImageData showImages(int page, int limit) {
        System.out.println(page + ":" + limit);
        PageInfo<Image> imagePageInfo = null;
        System.out.println(imageService);
        try {
            imagePageInfo = imageService.getImagesByPage(page, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ImageData("图片管理", "Images", 0, imagePageInfo.getTotal(), imagePageInfo.getList());
    }
}
