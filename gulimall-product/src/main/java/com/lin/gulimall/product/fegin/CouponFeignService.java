package com.lin.gulimall.product.fegin;

import com.lin.common.to.SkuReductionTo;
import com.lin.common.to.SpuBoundTo;
import com.lin.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @Author: 秋有鱼
 * @Date: 2022/12/4 23:59
 */

@FeignClient("gulimall-coupon")
public interface CouponFeignService {

    /**
     * 1、有一个serviced调用了CouponFeignService.saveSpuBounds()
     * 2、传了一个参数 对象！！SpuBoundTo，不是基本类型数据
     * 那么 springcloud 做的第一步
     * 1、将这个对象转为Json 需要 @RequestBody
     * 2、springcloud 会给远程服务发送/coupon/spubounds/save ，去注册中心找
     * 将上一步转的Json放在请求体的位置，发送请求
     * 3、对方服务收到请求，收到的是请求体有Json数据
     * 但如果对方的参数 @RequestBody SpuBoundsEntity spuBounds，将请求体的Json转为它
     * 所以参数不同是可以转的，但是两者的字段需要保持一致
     *
     * @param spuBoundTo
     * @return
     */
    @PostMapping("/coupon/spubounds/save")
    R saveSpuBounds(@RequestBody SpuBoundTo spuBoundTo);

    @PostMapping("/coupon/skufullreduction/saveInfo")
    R saveSkuReduction(@RequestBody SkuReductionTo skuReductionTo);
}
