package com.lin.common.constant;

import lombok.Data;

/**
 * @Author: 秋有鱼
 * @Date: 2022/11/28 12:46
 */

public class ProductConstant {
    public enum AttrEnum{
        ATTR_TYPE_BASE(1,"基本属性")
        ,ATTR_TYPE_SALE(0,"销售属性");

        private Integer code;
        private String message;

        AttrEnum(Integer code, String message) {
            this.code = code;
            this.message = message;
        }

        public Integer getCode() {
            return code;
        }

        public void setCode(Integer code) {
            this.code = code;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }
}
