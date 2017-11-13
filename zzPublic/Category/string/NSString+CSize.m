//
//  NSString+CSize.m
//  haochang
//
//  Created by yuandaiyong on 14-7-25.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import "NSString+CSize.h"

@implementation NSString (CSize)

- (CGSize)getSizeWithConntainSize:(CGSize)size font:(UIFont *)font
{
    CGSize strSize = CGSizeZero;
    
//    if(IOS7){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        strSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//    }else{
//        strSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
//    }
    
    return strSize;
}

+ (NSString *)formatNumberStringWithNumberString:(NSString*)numberString
{
    return [self formatNumberStringWithLongLong:numberString.longLongValue];
}

+ (NSString *)formatNumberStringWithNSNumber:(NSNumber*)number
{
    return [self formatNumberStringWithLongLong:number.longLongValue];
}

+ (NSString *)formatNumberStringWithLongLong:(long long)number
{
    NSString *tmpNumString = @"";
    
    if (number > 99.9*10000)
    {
        //不保留小数点 （eg:1234W 543W）
        CGFloat displayNumber = number/10000;
        if (displayNumber >= 10000) {
            
            tmpNumString = @"9999w";
        } else {
            
            tmpNumString = [NSString stringWithFormat:@"%.0fw",displayNumber];
        }
        
    }else if(number > 99999)
    {
        //保留小数点一位 (eg:20.3W)
        CGFloat displayNumber = number/10000.0f;
        tmpNumString = [NSString stringWithFormat:@"%.1fw",displayNumber];
    }else
    {
        //(eg:12345 123)
        tmpNumString = [NSString stringWithFormat:@"%lld",number];
    }
    tmpNumString=[tmpNumString stringByReplacingOccurrencesOfString:@".0w" withString:@"w"];
    return tmpNumString;
}

+ (NSString *)formatFileSizeStringWithDouble:(double)fileSize
{
    NSString    *strFileSize    = nil;
    
    fileSize    = fileSize/1024/1024;
    if (fileSize > 1024) {
        
        fileSize        = fileSize/1024;
        strFileSize     = [NSString stringWithFormat:@"%0.1fG",fileSize];
    }else {
        
        strFileSize     = [NSString stringWithFormat:@"%0.1fM",fileSize];
    }
    
    return strFileSize;
}

@end
