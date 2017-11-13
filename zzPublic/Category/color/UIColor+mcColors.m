//
//  UIColor+mcColors.m
//  haochang
//
//  Created by lc on 7/16/14.
//  Copyright (c) 2014 Administrator. All rights reserved.
//

#import "UIColor+mcColors.h"

#define AGEColorImplement(COLOR_NAME,RED,GREEN,BLUE)    \
+ (UIColor *)COLOR_NAME{    \
    static UIColor* COLOR_NAME##_color;    \
    static dispatch_once_t COLOR_NAME##_onceToken;   \
    dispatch_once(&COLOR_NAME##_onceToken, ^{    \
        COLOR_NAME##_color = [UIColor colorWithRed:(float)RED/255 green:(float)GREEN/255 blue:(float)BLUE/255 alpha:1.0];  \
    });\
return COLOR_NAME##_color;  \
}


@implementation UIColor (mcColors)

AGEColorImplement(mcMainBorderColor, 0xc6, 0x26, 0x44)
AGEColorImplement(mcSearchBarColor, 0xde, 0x28, 0x27)
AGEColorImplement(mcSystemColor, 0xf9, 0x3f, 0x3d)
AGEColorImplement(mcProgressBarColor, 0xfe, 0x4f, 0x5f)
AGEColorImplement(mcTitleBarColor, 0xfe, 0x49, 0x47)

AGEColorImplement(mcLampColor, 0x34, 0x75, 0xbc)
AGEColorImplement(mcRankTitleYellowColor, 0xf3, 0xd4, 0x00)
AGEColorImplement(mcDeepBackgroundColor, 0x38, 0x38, 0x38)

AGEColorImplement(mcSpaceLineColor, 0xc3, 0xc3, 0xc3)
AGEColorImplement(mcLightSpaceLineColor, 0xde, 0xde, 0xde)
AGEColorImplement(mcListPressedColor, 0xe8, 0xe8, 0xe8)
AGEColorImplement(mcSpaceFillColor, 0xef, 0xef, 0xef)
AGEColorImplement(mclightWhiteColor, 0xf9, 0xf9, 0xf9)
AGEColorImplement(mcTabBarBackgroundColor, 0xfb, 0xfb, 0xfb)
AGEColorImplement(mcPlayerTabBarBackgroundColor, 0x51, 0x51, 0x51)
AGEColorImplement(mcSpecialBackgroundColor, 0x3a, 0x4d, 0x5b)

AGEColorImplement(mcTipBackgroundColor, 0xff, 0xec, 0xd7)
AGEColorImplement(mcTipBackgroundLineColor, 0xff, 0xb6, 0x36)
AGEColorImplement(mcSystemIconColor, 0x9b, 0x9b, 0x9b)

AGEColorImplement(mcListWordGroundColor, 0xff, 0xf9, 0xeb)
AGEColorImplement(mcListWordGroundLineColor, 0xff, 0xd5, 0x89)

AGEColorImplement(mcRedColor, 0xff, 0x4a, 0x48)
AGEColorImplement(mcLightRedColor, 0xff, 0xa1, 0xa0)
AGEColorImplement(mcOrangeColor, 0xfc, 0x7e, 0x18)
AGEColorImplement(mclightOrangeColor, 0xff, 0xac, 0x28)
AGEColorImplement(mcGreenColor, 0x2d, 0x9b, 0x2f)
AGEColorImplement(mcLightGreenColor, 0x57, 0xc0, 0x5e)
AGEColorImplement(mcDeepGrayColor, 0x28, 0x28, 0x28)
AGEColorImplement(mcGrayColor, 0x73, 0x73, 0x73)
AGEColorImplement(mcLightGrayColor, 0xa9, 0xa9, 0xa9)
AGEColorImplement(mcPaleGrayColor, 0xca, 0xca, 0xca)

AGEColorImplement(mcRedBtnColor, 0xff, 0x5a, 0x58)
AGEColorImplement(mcBlueBtnColor, 0x68, 0x99, 0xd7)
AGEColorImplement(mcGrayBtnColor, 0xc3, 0xc3, 0xc3)
AGEColorImplement(mcGreenBtnColor, 0x27, 0xc8, 0xb4)
AGEColorImplement(mcLightGreenBtnColor, 0xdb, 0xfb, 0xf6)

AGEColorImplement(mcDeepBlueColor, 0x46, 0x5a, 0x85)
AGEColorImplement(mcBlueColor, 0x1d, 0x7a, 0xc1)
AGEColorImplement(mcLightBlueColor, 0x01, 0xb3, 0xfd)

@end
