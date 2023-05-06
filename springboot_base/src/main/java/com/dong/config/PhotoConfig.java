package com.dong.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 图片上传配置类
 */

@Data
@Component
@ConfigurationProperties(prefix = "photo")
public class PhotoConfig {

    private String uploadPhotoPath; //图片保存的位置

    private String uploadPhotoSuffix;  //图片的格式

    private long uploadPhotoMaxSize; //图片的大小
}
