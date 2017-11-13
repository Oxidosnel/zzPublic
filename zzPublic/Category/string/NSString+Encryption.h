//
//  NSString+Encryption.h
//  haochang
//
//  Created by Administrator on 14-4-15.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

+ (NSString *)md5:(NSString *)str;

+ (NSString*) sha1:(NSString *)str;

@end
