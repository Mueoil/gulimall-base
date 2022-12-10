package com.lin.gulimall.ware.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: 秋有鱼
 * @Date: 2022/12/6 23:11
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MergeVo {
    private Long purchaseId;    //采购id
    private List<Long> items;       //合并采购需求id
}
