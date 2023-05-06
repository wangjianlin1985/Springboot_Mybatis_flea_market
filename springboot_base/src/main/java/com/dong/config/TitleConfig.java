package com.dong.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 标题设置配置类
 */

@Component
@Data
@ConfigurationProperties(prefix = "title")
public class TitleConfig {

    private String sysName;

    private String userTitle;

    private String menuTitle;

    private String roleTitle;

    private String logTitle;

    private String databaseTitle;

    private String categoryTitle;

    private String goodTitle;

    private String studentTitle;

    private String commentTitle;

    private String newsTitle;

    private String homeName;

}
