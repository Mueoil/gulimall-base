package com.lin.common.to;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @Author: 秋有鱼
 * @Date: 2022/12/5 0:07
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SpuBoundTo {
    private Long spuId;
    private BigDecimal buyBounds;
    private BigDecimal growBounds;
}
