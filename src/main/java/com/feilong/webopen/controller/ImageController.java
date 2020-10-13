package com.feilong.webopen.controller;

import com.feilong.webopen.bean.ImageData;
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

    @RequestMapping("/showImages")
    public ImageData showImages(int page){
        System.out.println(page);
        return new ImageData();
    }
}
