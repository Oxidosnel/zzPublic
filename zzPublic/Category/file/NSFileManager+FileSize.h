//
//  NSFileManager+FileSize.h
//  haochang
//
//  Created by Eason on 14-9-2.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FileSize)

+ (double)fileSizeWithPath:(NSString*)filePath;

+ (NSString*)fileSizeStringWithPath:(NSString*)filePath;

@end
