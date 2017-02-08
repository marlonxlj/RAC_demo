//
//  UIImage+Extension.h
//  Pods
//
//  Created by m on 2017/2/8.
//
//
// 异步裁剪图片圆角

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 裁剪圆角

 @param size 传入图片的大小
 @param fillColor 填充颜色
 @param completion 把image回调给，调用者
 */
- (void)xlj_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *image))completion;

@end
