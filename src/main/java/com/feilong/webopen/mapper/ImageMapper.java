package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Image;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/12 23:06
 */
@SuppressWarnings("ALL")
@Repository
public interface ImageMapper {
    List<Image> getImageList();

    void insertImage(Image image);

    void deleteImageByIds(long[] ids);

}
