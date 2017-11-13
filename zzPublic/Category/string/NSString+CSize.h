//
//  NSString+CSize.h
//  haochang
//
//  Created by yuandaiyong on 14-7-25.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CSize)

- (CGSize)getSizeWithConntainSize:(CGSize)size font:(UIFont *)font;

+ (NSString *)formatNumberStringWithNumberString:(NSString*)numberString;

+ (NSString *)formatNumberStringWithNSNumber:(NSNumber*)number;

+ (NSString *)formatNumberStringWithLongLong:(long long)number;

+ (NSString *)formatFileSizeStringWithDouble:(double)fileSize;

@end
