/**
  * Copyright 2022 bejson.com 
  */
package com.lin.gulimall.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * Auto-generated: 2022-12-04 18:47:16
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberPrice {

    private Long id;
    private String name;
    private BigDecimal price;

}