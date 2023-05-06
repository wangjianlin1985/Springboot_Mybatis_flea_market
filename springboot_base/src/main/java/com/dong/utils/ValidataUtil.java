package com.dong.utils;

import com.dong.annotion.Validata;
import com.dong.exception.CodeMsg;

import org.springframework.util.StringUtils;

import java.lang.reflect.Field;

/**
 * 校验工具类
 */
public class ValidataUtil {

    public static CodeMsg validata(Object object) {
        Field[] fields = object.getClass().getDeclaredFields();
        for (Field field : fields) {
            Validata annotation = field.getAnnotation(Validata.class);
            if (annotation != null) {
                if (annotation.required()) {
                    field.setAccessible(true);
                    try {
                        Object o = field.get(object);
                        if (StringUtils.isEmpty(o)) {
                            CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                            codeMsg.setMsg(annotation.errorRequiredMsg());
                            return codeMsg;
                        }

                        if (o instanceof String) {
                            if (annotation.requiredLength()) {
                                if (o.toString().length() > annotation.maxLength()) {
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMaxLengthMsg());
                                    return codeMsg;
                                }

                                if (o.toString().length() < annotation.minLength()) {
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMinLengthMsg());
                                    return codeMsg;
                                }
                            }
                        }

                        if(isNumberObject(o)){
                            //判断是否规定检查最小值
                            if(annotation.requiredMinValue()){
                                if(Double.valueOf(o.toString()) <= annotation.minValue()){
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMinValueMsg());
                                    return codeMsg;
                                }
                            }
                            //判断是否规定检查最大值
                            if(annotation.requiredMaxValue()){
                                if(Double.valueOf(o.toString()) > annotation.maxValue()){
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMaxValueMsg());
                                    return codeMsg;
                                }
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }
            }

        }
        return CodeMsg.SUCCESS;
    }

    public static boolean isNumberObject(Object object){
        if(object instanceof Integer)return true;
        if(object instanceof Long)return true;
        if(object instanceof Float)return true;
        if(object instanceof Double)return true;
        return false;
    }
}
