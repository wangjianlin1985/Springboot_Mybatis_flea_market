package com.dong.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * ajax提交统一返回结果类
 *
 */
@Setter
@Getter
public class Result<T> {
    private Integer code;

    private String msg;

    private  T data;

    private Result(){

    }

    private Result(CodeMsg codeMsg){
        if(codeMsg != null){
            this.code = codeMsg.getCode();
            this.msg = codeMsg.getMsg();
        }
    }

    private Result(T data,CodeMsg codeMsg){
        if(codeMsg != null){
            this.code=codeMsg.getCode();
            this.msg=codeMsg.getMsg();
            }
            this.data=data;
    }

    public static <T>Result<T> success(T data){
        return new Result<T>(data,CodeMsg.SUCCESS);
    }

    public static <T>Result<T> exception(CodeMsg codeMsg){
        return  new Result<T>(codeMsg);
    }
}
