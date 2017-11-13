//
//  NSFileManager+FileSize.m
//  haochang
//
//  Created by Eason on 14-9-2.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import "NSFileManager+FileSize.h"

@implementation NSFileManager (FileSize)

+ (NSString*)fileSizeStringWithPath:(NSString*)filePath
{
    NSString    *strFileSize    = nil;
    
    double  fileSize    = [self fileSizeWithPath:filePath];
    fileSize            = fileSize/1024/1024;
    if (fileSize > 1024) {
        
        fileSize        = fileSize/1024;
        strFileSize     = [NSString stringWithFormat:@"%0.1fG",fileSize];
    }else {
        
        strFileSize     = [NSString stringWithFormat:@"%0.1fM",fileSize];
    }
    
    return strFileSize;
}

+ (double)fileSizeWithPath:(NSString*)filePath
{
    double totalLength  = 0.0;
    
    BOOL    isDir;
    BOOL    isExist    = [[self defaultManager] fileExistsAtPath:filePath isDirectory:&isDir];
    if(isExist){
        
        if (isDir) {
            
            NSArray *subpaths  = [[self defaultManager] subpathsAtPath:filePath];
            for (NSString *lastComponent in subpaths) {
                
                NSString *newFilePath = [filePath stringByAppendingPathComponent:lastComponent];
                
                if ([[self defaultManager] fileExistsAtPath:newFilePath isDirectory:&isDir] && !isDir) {
                    
                    NSDictionary * attributes = [[self defaultManager] attributesOfItemAtPath:newFilePath error:nil];
                    NSNumber *size      = [attributes objectForKey:NSFileSize];
                    if (size) {
                        totalLength += [size intValue];
                    }
                };
            }
            
        }else{
            
            NSDictionary * attributes = [[self defaultManager] attributesOfItemAtPath:filePath error:nil];
            NSNumber *size      = [attributes objectForKey:NSFileSize];
            
            if (size) {
                totalLength += [size intValue];
            }
        }
    }
    
    return totalLength;
}

@end
