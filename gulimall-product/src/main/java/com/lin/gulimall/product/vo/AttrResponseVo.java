package com.lin.gulimall.product.vo;

import lombok.Data;

/**
 * @Author: 秋有鱼
 * @Date: 2022/11/26 15:30
 */

@Data
public class AttrResponseVo extends AttrVo{
//    前端需要展示所属分类名字和所属组名字
    private String catelogName;
    private String groupName;
    private Long[] catelogPath;

}
