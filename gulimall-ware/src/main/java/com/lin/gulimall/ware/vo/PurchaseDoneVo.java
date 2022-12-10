package com.lin.gulimall.ware.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @Author: 秋有鱼
 * @Date: 2022/12/9 20:26
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseDoneVo {
    @NotNull
    private Long id;
    private List<ItemVo> items;
}
