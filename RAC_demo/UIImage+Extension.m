//
//  UIImage+Extension.m
//  Pods
//
//  Created by m on 2017/2/8.
//
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (void)xlj_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        //1.开启图形上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        //2.设置填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        
        //3.使用贝塞尔进行裁切
        //3.1 创建贝塞尔路径
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        //3.2 进行裁切
        [path addClip];
        
        //4. 绘制图像
        [self drawInRect:rect];
        
        //5. 获取到结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        //6.关闭上下文
        UIGraphicsEndImageContext();
        
        //7.回调
        dispatch_async(dispatch_get_main_queue(), ^{
           
            if (completion != nil) {
                completion(result);
            }
            
        });
        
        
    });
}

@end
