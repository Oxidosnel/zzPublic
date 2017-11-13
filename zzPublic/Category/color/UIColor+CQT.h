//
//  UIColor+CQT.h
//  CQTIGuoGuo
//
//  Created by sanzrew on 15/11/9.
//  Copyright © 2015年 sanzrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor(CQT)


+(UIColor *)randomColor;

+(UIColor *)swichGreen;
//背景灰
+(UIColor *)bg_soft_grayColor;

//内容字灰
+(UIColor *)cont_soft_grayColor;

//内容深灰
+(UIColor *)cont_dark_grayColor;

//导航栏颜色
+(UIColor *)nav_orangeColor;
//角标背景颜色
+(UIColor *)badge_redColor;



/**
 *  返回一般背景颜色 HEX_RGB(0xf1f2f6);
 *
 *  @return 
 */
+(UIColor *)normalBgColor;

/**
 *  一般橘黄色 ff6600
 *
 *  @return
 */
+(UIColor *)normalOrangeColor;

/**
 *  一般文字灰色 999999
 *
 *  @return
 */
+(UIColor *)normalTextGray;

/**
 *  提货点左边选择区域背景
 *
 *  @return
 */
+(UIColor *)cellBgGray;


/**
 通过16进制编码创建颜色 #开头
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColor;

/**
 通过16进制编码创建颜色 并设置透明值 #开头
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha;

/**
 通过16进制编码创建颜色 0x开头
 */
+ (UIColor *)colorWithHex:(long)hexColor;

/**
 通过16进制编码创建颜色 并设置透明值 0x开头
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha;

/**
 通过RGB三原色创建颜色 #开头
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 通过RGB三原色创建颜色 并设置透明值 #开头
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;
@end
