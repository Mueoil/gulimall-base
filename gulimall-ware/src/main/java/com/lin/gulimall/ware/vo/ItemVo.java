package com.lin.gulimall.ware.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: 秋有鱼
 * @Date: 2022/12/9 20:33
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemVo {
    private Long itemId;
    private Integer status;
    private String reason;
}
