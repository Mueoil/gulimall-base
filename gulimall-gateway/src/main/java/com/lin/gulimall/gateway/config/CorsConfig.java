package com.lin.gulimall.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsConfigurationSource;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.server.ServerWebExchange;

/**
 * @Author: 秋有鱼
 * @Date: 2022/11/13 13:16
 */

@Configuration
public class CorsConfig {

    @Bean
    public CorsWebFilter corsWebFilter(){
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        /**：任何路径都要进行跨域配置
        CorsConfiguration corsConfiguration = new CorsConfiguration();
//        配置跨域
        corsConfiguration.addAllowedHeader("*");        //允许哪些请求头
        corsConfiguration.addAllowedMethod("*");        //允许哪些请求方法
        corsConfiguration.addAllowedOrigin("*");        //允许哪个请求来源
        corsConfiguration.setAllowCredentials(true);    //是否允许携带 token 进行跨域
        source.registerCorsConfiguration("/**",corsConfiguration);
        return new CorsWebFilter(source);
    }
}
