package com.lin.gulimall.product.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Author: 秋有鱼
 * @Date: 2022/11/25 17:21
 */

@Configuration
@EnableTransactionManagement
public class MyConfig  {
    @Bean
    public PaginationInterceptor paginationInterceptor(){
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
//        设置请求的页面大于最大页后操作，true调回到苜页，false继续请求 默认和 false
        paginationInterceptor.setOverflow(true);
//        设置最大单页限制数量，默认500条，-1 不受限制
        paginationInterceptor.setLimit(1000L);
        return paginationInterceptor;
    }
}
