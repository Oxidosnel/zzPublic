//
//  NSString+DES.h
//  haochang
//
//  Created by Administrator on 14-4-15.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)

//加密
+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
//解密
+(NSString *) decryptUseDES:(NSString *)plainText key:(NSString *)key;

@end
