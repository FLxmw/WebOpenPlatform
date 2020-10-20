package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.ImageData;
import com.feilong.webopen.bean.PhotosData;
import com.feilong.webopen.bean.UploadImageData;
import com.feilong.webopen.entity.Image;
import com.feilong.webopen.service.ImageService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

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

    @RequestMapping("/uploadImages")
    public UploadImageData uploadImages(HttpServletRequest request, MultipartFile image) throws IOException, IOException {
        System.out.println(image);
        // 获取上传文件的服务器下的目录
        String realPath = request.getSession().getServletContext().getRealPath("/static/images");
        //创建File对象，实例化realPath
        File file = new File(realPath);
        //判断是否存在，不存在则创建
        if (!file.exists()) {
            file.mkdirs();
        }
        //获取要上传文件的名称 image1.jpg
        String filename = image.getOriginalFilename();
        //将文件插入到数据库  插入路径格式 src:images/image1.jpg  thumb:images/image1.jpg  alt:image1
        String preImage = "images/";
        Image images = new Image();
        images.setSrc(preImage + filename);
        images.setThumb(images.getSrc());
        int lastIndexOf = filename.lastIndexOf(".");
        String alt = filename.substring(0, lastIndexOf);
        images.setAlt(alt);
        //上传文件
        image.transferTo(new File(file, filename));
        try {
            imageService.insertImage(images);
            return new UploadImageData(0, "图片上传成功！", images);
        } catch (Exception e) {
            e.printStackTrace();
            return new UploadImageData(1, "图片上传失败！", null);
        }
    }

    @RequestMapping("/showPhoto")
    public PhotosData showPhoto() {
        List<Image> imageList = null;
        try {
            imageList = imageService.getImageList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new PhotosData("图片展示", "Images", 0, imageList);
    }

    @RequestMapping("/deleteImage")
    public AjaxMessage deleteImage(long[] ids) {
        try {
            imageService.deleteImageByIds(ids);
            return new AjaxMessage(true, "图片删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxMessage(false, "图片删除失败！");
        }
    }
}
