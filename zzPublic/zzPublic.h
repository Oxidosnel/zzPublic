//
//  zzPublic.h
//
//  Created by Oxidosnel.
//  Copyright (c) 2017年 kongniao. All rights reserved.
//

#import "NSObject+Resource.h"
#import "NSData+AES256.h"

#import "UIImageView+ZZNetworking.h"

#import "UIButton+EnlargeEdge.h"

#import "UIColor+CQT.h"

#import "UIColor+FlatColors.h"

#import "UIColor+mcColors.h" //

#import "NSFileManager+FileSize.h"

#import "UIFont+mcFonts.h" //

#import "UIIamge+Compress.h"
#import "UIImage+BoxBlur.h"
#import "UIImage+Comm.h"
#import "UIImage+Resize.h"

#import "UILabel+Height.h"

#import "NSString+CSize.h"
#import "NSString+DES.h"
#import "NSString+Encryption.h"
#import "NSString+Predicate.h"
#import "NSString+Time.h"
#import "NSString+MD5.h"

#import "UIView+Rect.h"


#define MAINTABVC [(AppDelegate*)[[UIApplication sharedApplication] delegate] MainTabVc]

#define safelyStr(__obj) [NSObject stringSafety:(__obj)]
#define safelyAry(__obj) [NSObject arraySafety:(__obj)]
#define safelyMutableAry(__obj) [NSObject mutableArraySafety:(__obj)]

#define validObj(__obj) [NSObject checkValidObject:(__obj)]
#define validStr(__obj) [NSObject checkValidNSString:(__obj)]
#define validAry(__obj) [NSObject checkValidAry:(__obj)]
#define validMutableAry(__obj) [NSObject checkValidMutableAry:(__obj)]
#define validDic(__obj) [NSObject checkValidDictionary:(__obj)]
#define validMutableDic(__obj) [NSObject checkValidMutableDictionary:(__obj)]
/* iOS系统版本判断 */
#define iOS_IS_UP_VERSION(__cnt)    ([[[UIDevice currentDevice] systemVersion] doubleValue] >=__cnt)
#define iOS_IS_DOWN_VERSION(__cnt)  ([[[UIDevice currentDevice] systemVersion] doubleValue] < __cnt)
#define CurrentSystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]

//获取屏幕信息（尺寸，宽，高）
#define LcdSize     [[UIScreen mainScreen] bounds]
#define LCDW        LcdSize.size.width
#define LCDH        (LcdSize.size.height-20)
#define IS_HEIGHT_GTE_568 ([[UIScreen mainScreen]bounds].size.height >= 568.0f)
#define LCDW_568    (568)
/* 屏幕宽度 */
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
/* 屏幕高度 */
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

//blok 引用
#define WEAKSELF        typeof(self) __weak weakSelf = self
#define STRONGSELF      typeof(weakSelf) __strong strongSelf = weakSelf

//iamge
#define imageWithName(_name) [UIImage imageNamed:_name]



#undef	RGB
#define RGB(R,G,B)		[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef	RGBA
#define RGBA(R,G,B,A)	[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

/* 角度转弧度 */
#define DEGREES_TO_RADIANS(__ANGLE) ((__ANGLE) / 180.0 * Double.pi)
// 弧度转角度
#define RADIANS_TO_DEGREES(__DEGREE) ((__DEGREE / Double.pi) * 180.f)

/* 设置系统字体 */
#define Font(__f) [UIFont systemFontOfSize:__f]
/* 设置系统粗体 */
#define BoldFont(__f) [UIFont boldSystemFontOfSize:__f]

/* 设置每页size */
#define FlowCountLimit    50

//-------------------文件存储路径 begin-------------------
#define PathDocuments       [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define PathLibrary         [NSHomeDirectory() stringByAppendingPathComponent:@"Library"]
#define PathTmp             [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"]
#define PathPreferences     [PathLibrary stringByAppendingPathComponent:@"Preferences"]
#define PathCaches          [PathLibrary stringByAppendingPathComponent:@"Caches"]

//AF图片缓存
#define PathAFImageCach         [PathCaches stringByAppendingPathComponent:@"AFImageCache"]

//-------------------通知 begin-------------------
#define ZZ_Update_Flow  @"ZZ_Update_Flow"

//-------------------常用业务函数-------------------
#define ZZ_WRITE_REVIEW(__appID__)  \
\
NSString *appID = __appID__; \
NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?action=write-review", appID]; \
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
