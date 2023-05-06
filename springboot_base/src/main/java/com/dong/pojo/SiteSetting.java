package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.io.Serializable;

/**
 * (SiteSetting)实体类
 *
 * @author makejava
 * @since 2020-07-24 22:27:30
 */
@Data
public class SiteSetting implements Serializable {
    private static final long serialVersionUID = 441189154292042640L;
    
    private Integer id;

    @Validata(required = true,requiredLength = true,minLength=1,maxLength=64,errorRequiredMsg="网站名称不能为空!",errorMinLengthMsg="网站名称长度需大于1!",errorMaxLengthMsg="网站设置名称长度不能大于128!")
    private String siteName;

    @Validata(required=true,requiredLength=true,minLength=1,maxLength=256,errorRequiredMsg="网站URL地址不能为空!",errorMinLengthMsg="网站URL地址长度需大于1!",errorMaxLengthMsg="网站URL地址长度不能大于256!")
    private String siteUrl;

    @Validata(required=true,requiredLength=true,minLength=1,maxLength=256,errorRequiredMsg="网站logo不能为空!",errorMinLengthMsg="网站logo长度需大于1!",errorMaxLengthMsg="网站logo长度不能大于256!")
    private String logo1;

    @Validata(required=true,requiredLength=true,minLength=1,maxLength=256,errorRequiredMsg="网站logo不能为空!",errorMinLengthMsg="网站logo长度需大于1!",errorMaxLengthMsg="网站logo长度不能大于256!")
    private String logo2;

    @Validata(required=true,requiredLength=true,minLength=1,maxLength=256,errorRequiredMsg="网站公众号二维码不能为空!",errorMinLengthMsg="网站公众号二维码长度需大于1!",errorMaxLengthMsg="网站公众号二维码长度不能大于256!")
    private String code;

    @Validata(required=true,requiredLength=true,minLength=1,maxLength=256,errorRequiredMsg="网站版权信息不能为空!",errorMinLengthMsg="网站版权信息长度需大于1!",errorMaxLengthMsg="网站版权信息长度不能大于256!")
    private String allRights;


}