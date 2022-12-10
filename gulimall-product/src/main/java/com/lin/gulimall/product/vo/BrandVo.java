package com.lin.gulimall.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: 秋有鱼
 * @Date: 2022/12/2 22:43
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrandVo {
//    前端只需要这两个参数
    private Long brandId;
    private String brandName;
}
