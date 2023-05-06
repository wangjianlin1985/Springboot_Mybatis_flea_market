package com.dong.service;

import com.dong.mapper.SiteSettingMapper;
import com.dong.pojo.SiteSetting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteSettingService {

    @Autowired
    private SiteSettingMapper siteSettingMapper;

    public SiteSetting selectSite(){
        return  siteSettingMapper.selectSite();
    }

    public void updateSite(SiteSetting siteSetting){
        siteSettingMapper.updateSite(siteSetting);
    }
}
