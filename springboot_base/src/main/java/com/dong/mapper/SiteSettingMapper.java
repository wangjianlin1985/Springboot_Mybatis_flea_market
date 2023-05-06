package com.dong.mapper;

import com.dong.pojo.SiteSetting;

public interface SiteSettingMapper {
    SiteSetting selectSite();

    void updateSite(SiteSetting siteSetting);

 }
