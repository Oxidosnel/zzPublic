//
//  UIColor+CQT.m
//  CQTIGuoGuo
//
//  Created by sanzrew on 15/11/9.
//  Copyright © 2015年 sanzrew. All rights reserved.
//

#import "UIColor+CQT.h"

@implementation UIColor(CQT)
+(UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:1.0];
}
//swichGreen
+(UIColor *)swichGreen{
    return  [UIColor colorWithRed:76/255.0f green:216/255.0f blue:100/255.0f alpha:0.6];
}
+(UIColor *)normalBgColor{
    return HEX_RGB(0xf1f2f6);
}


//背景灰
+(UIColor *)bg_soft_grayColor{
    return HEX_RGB(0xf1f2f6);
}
//内容字灰
+(UIColor *)cont_soft_grayColor{
    return HEX_RGB(0x999999);
}
//内容深灰
+(UIColor *)cont_dark_grayColor{
    return HEX_RGB(0x333333);
}
//导航栏颜色
+(UIColor *)nav_orangeColor{
    return HEX_RGB(0xff6000);
}

//角标背景颜色
+(UIColor *)badge_redColor{
    return HEX_RGB(0xf03840);
}

+(UIColor *)normalOrangeColor{
    return HEX_RGB(0xff6600);
}

+(UIColor *)normalTextGray{
    return HEX_RGB(0x999999);
}


+(UIColor *)cellBgGray{
    return HEX_RGB(0xf4f4f4);
}

+ (UIColor *)colorWithHexString:(NSString *)hexColor
{
    return [self colorWithHexString:hexColor alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha
{
    if (hexColor == nil||hexColor.length!=7||[safelyStr(hexColor) rangeOfString:@"#"].location==NSNotFound) {
        return [UIColor clearColor];
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}

+ (UIColor *)colorWithHex:(long)hexColor
{
    return [self colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue
{
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}
@end
