package com.dong.annotion;

import java.lang.annotation.*;

/**
 * 校验注解
 */

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Validata {
     boolean required() default false;//是否检验null

     boolean requiredLength() default false;//是否检验检验长度

     boolean requiredMaxValue() default false;//是否检验最大值

     boolean requiredMinValue() default false;//是否检验最小值

     int maxLength() default -1;//最大长度

     int minLength() default -1;//最小长度

     long maxValue() default -1;//大值

     long minValue() default -1;//最小值

     String errorRequiredMsg() default "";//值为null时的错误提示信息

     String errorMinLengthMsg() default "";//最小长度不满足时的提示信息

     String errorMaxLengthMsg() default "";//最大长度不满足时的提示信息

     String errorMinValueMsg() default "";//最小值不满足时的提示信息

     String errorMaxValueMsg() default "";//最大值不满足时的提示信息
}
