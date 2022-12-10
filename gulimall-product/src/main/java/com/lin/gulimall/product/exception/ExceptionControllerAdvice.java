package com.lin.gulimall.product.exception;

import com.lin.common.exception.BizCodeEnume;
import com.lin.common.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 秋有鱼
 * @Date: 2022/11/18 21:39
 */

/**
 * 集中处理异常
 */
@Slf4j
@RestControllerAdvice(basePackages = "com.lin.gulimall.product.controller")
public class ExceptionControllerAdvice {


//    数据校验异常处理
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public R handleValidException(MethodArgumentNotValidException e){
        log.error("数据校验出现问题{}，异常类型：{}",e.getMessage(),e.getClass());
        BindingResult result = e.getBindingResult();
        Map<String,String> map = new HashMap<>();
        result.getFieldErrors().forEach(item->{
            map.put(item.getField(),item.getDefaultMessage());
        });
        return R.error(BizCodeEnume.VALID_EXCEPTION.getCode(),BizCodeEnume.VALID_EXCEPTION.getMessage()).put("data",map);
    }

//    公共处理异常
    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable throwable){
        log.error("公共处理异常{}",throwable.getMessage());
        return R.error(BizCodeEnume.UNKNOW_EXCEPTION.getCode(),BizCodeEnume.UNKNOW_EXCEPTION.getMessage());
    }
}
