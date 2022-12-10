package com.lin.gulimall.product;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lin.gulimall.product.entity.BrandEntity;
import com.lin.gulimall.product.service.BrandService;
import com.lin.gulimall.product.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

@Slf4j
@SpringBootTest
@RunWith(SpringRunner.class)
public class GulimallProductApplicationTests {
    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

     @Test
     public void contextLoads() {
//        BrandEntity brandEntity = new BrandEntity();
         QueryWrapper<BrandEntity> wrapper = new QueryWrapper<>();
         wrapper.eq("name","华为");
         List<BrandEntity> list = brandService.list(wrapper);
         long count = list.stream()
                 .map(brandEntity -> brandEntity.getBrandId())
                 .count();
         System.out.println(count);
     }

     @Test
    public void testFindPath(){
         Long[] catelogPath = categoryService.findCatelogPath(225L);
         log.info("完整路径：{}", Arrays.asList(catelogPath));
     }



//     @Test
//    public void forSum(){
//         int sum = 0;
//         for (int i = 1; i <= 100; i++) {
//             sum = sum + i;
//         }
//         System.out.println(sum);
//     }
//
//     @Test
//    public void whileSum(){
//         int sum = 0;
//         int a = 1;
//         while (a <= 100){
//             sum = sum + a;
//             a++;
//         }
//         System.out.println(sum);
//     }
//
//     @Test
//    public void doWhileSum(){
//         int sum = 0;
//         int a = 1;
//         do{
//             sum = sum + a;
//             a++;
//         }while (a <= 100);
//         System.out.println(sum);
//     }
//
//     @Test
//     public void diguiSum(){
//         System.out.println(digui(1));
//     }
//     public Integer digui(int a){
//         if (a>=1 && a<=100){
//             return a + digui(a + 1);
//         }
//         return 0;
//     }
//
//     @Test
//    public void lambdaSum(){
//         int max = 100;
//         int sum = IntStream.range(0,max+1).sum();
//         System.out.println(sum);
//     }
}
