package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * (Good)实体类
 *
 * @author makejava
 * @since 2020-07-12 15:10:16
 */
@Data
public class Good implements Serializable {
    private static final long serialVersionUID = -72014048779001536L;

    public static final int GOOD_STATUS_UP = 1;//上架
    public static final int GOOD_STATUS_DOWN = 2;//下架
    public static final int GOOD_STATUS_SOLD = 3;//已售出
    /**
    * 商品id
    */
    private Integer id;
    /**
    * 商品名称
    */
    @Validata(required = true,requiredLength = true,errorRequiredMsg = "商品名称不能为空",minLength = 1,maxLength = 50,errorMinLengthMsg = "商品名称长度至少为1!",errorMaxLengthMsg = "商品名称长度不能大于50!")
    private String name;
    /**
    * 商品描述
    */
    @Validata(required = true,requiredLength = true,errorRequiredMsg = "商品描述不能为空",minLength = 6,maxLength = 500,errorMinLengthMsg = "商品名称长度至少为6!",errorMaxLengthMsg = "商品名称长度不能大于500!")
    private String describle;
    /**
    * 商品价格
    */
    @Validata(required = true,requiredMinValue = true,errorRequiredMsg = "商品价格不能为空!",minValue = 0,errorMinValueMsg = "商品价格不能低于0!")
    private Float price;
    /**
    * 商品图片
    */
    private String photo;
    /**
    * 商品状态
    */
    private Integer status;
    /**
    * 商品所属分类
    */
    private Integer categoryId;
    /**
    * 商品所属学生
    */
    private Integer studentId;

    /**
     * 商品浏览次数
     */
    private Integer viewNumber;
    /**
    * 商品添加时间
    */
    private Date createTime;

}