package com.lin.gulimall.member.fegin;

import com.lin.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: 秋有鱼
 * @Date: 2022/11/10 23:17
 */

@FeignClient("gulimall-coupon")
public interface CouponFeginService {

    @RequestMapping("coupon/coupon/memberCoupons/list")
    public R memberCoupons();
}
