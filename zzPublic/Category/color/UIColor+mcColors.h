//
//  UIColor+mcColors.h
//  haochang
//
//  Created by lc on 7/16/14.
//  Copyright (c) 2014 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (mcColors)

/*主色边线*/
+ (UIColor *)mcMainBorderColor;

/*搜索条*/
+ (UIColor *)mcSearchBarColor;

/*系统主色*/
+ (UIColor *)mcSystemColor;

/*进度条*/
+ (UIColor *)mcProgressBarColor;

/*首页title栏*/
+ (UIColor *)mcTitleBarColor;

/*通知提醒灯*/
+ (UIColor *)mcLampColor;

/*榜单导航栏*/
+ (UIColor *)mcRankTitleYellowColor;

/*头像下层，大背景色，全国榜按下*/
+ (UIColor *)mcDeepBackgroundColor;

/*深间隔线 (边线)，搜索背景*/
+ (UIColor *)mcSpaceLineColor;

/*浅间隔线 (Cell中间线)*/
+ (UIColor *)mcLightSpaceLineColor;

/*列表点击*/
+ (UIColor *)mcListPressedColor;

/*间隔填充*/
+ (UIColor *)mcSpaceFillColor;

/*区块填充，二级页面，标题栏*/
+ (UIColor *)mclightWhiteColor;

/*底部导航背景色*/
+ (UIColor *)mcTabBarBackgroundColor;

/*播放页底部背景色*/
+ (UIColor *)mcPlayerTabBarBackgroundColor;

/*播放按钮，折叠背景*/
+ (UIColor *)mcSpecialBackgroundColor;

/*提示栏*/
+ (UIColor *)mcTipBackgroundColor;

/*提示栏边线*/
+ (UIColor *)mcTipBackgroundLineColor;

/*系统图标*/
+ (UIColor *)mcSystemIconColor;

/*列表提示背景*/
+ (UIColor *)mcListWordGroundColor;

/*列表提示栏边线*/
+ (UIColor *)mcListWordGroundLineColor;

/***
 ***文字颜色***
 ***/

+ (UIColor *)mcRedColor;

+ (UIColor *)mcLightRedColor;

+ (UIColor *)mcOrangeColor;

+ (UIColor *)mclightOrangeColor;

+ (UIColor *)mcGreenColor;

+ (UIColor *)mcLightGreenColor;

+ (UIColor *)mcDeepGrayColor;

+ (UIColor *)mcGrayColor;

+ (UIColor *)mcLightGrayColor;

+ (UIColor *)mcPaleGrayColor;

/***
 ***按钮颜色***
 ***/
+ (UIColor *)mcRedBtnColor;

+ (UIColor *)mcBlueBtnColor;

+ (UIColor *)mcGrayBtnColor;

+ (UIColor *)mcGreenBtnColor;

+ (UIColor *)mcLightGreenBtnColor;

/***
 ***用户名专用***
 ***/

+ (UIColor *)mcDeepBlueColor;

+ (UIColor *)mcBlueColor;

+ (UIColor *)mcLightBlueColor;
@end
