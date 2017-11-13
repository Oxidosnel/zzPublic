//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2013-2014, {Bee} open source community
//	http://www.bee-framework.com
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#import "NSObject+Resource.h"

#
#pragma mark -

@implementation NSObject(Resource)



+ (NSString *)stringSafety:(id)str {
    
    NSString *returnStr = @"";
    if (!str || [str isKindOfClass:[NSNull class]]) {
    }else if ([str isKindOfClass:[NSString class]]) {
        
        returnStr = str;
    }else if ([str isKindOfClass:[NSObject class]]) {
        
        returnStr = [NSString stringWithFormat:@"%@",str];
    }else if ([str isKindOfClass:[NSNumber class]]) {
    
        returnStr = [NSString stringWithFormat:@"%@",str];
    }else{
        returnStr = @"";
    }
    return returnStr;
}

+ (NSArray *)arraySafety:(id)list {
    
    NSArray *array = [[NSArray alloc] init];
    
    if (list && [list isKindOfClass:[NSArray class]]) {
        return list;
    }
    
    return array;
}

+ (NSMutableArray *)mutableArraySafety:(id)list {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    if (list && [list isKindOfClass:[NSMutableArray class]]) {
        return list;
    }
    
    return array;
}


+ (BOOL)checkValidObject:(id)obj {
    
    if (!obj) {
        
        return NO;
    }
    if ( [obj isKindOfClass:[NSArray class]] )
	{
        return [NSObject checkValidAry:obj];
	}
    else if ( [obj isKindOfClass:[NSMutableArray class]] )
	{
        return [NSObject checkValidMutableAry:obj];
	}
	else if ( [obj isKindOfClass:[NSDictionary class]] )
	{
        return [NSObject checkValidDictionary:obj];
	}
    else if ( [obj isKindOfClass:[NSMutableDictionary class]] )
	{
        return [NSObject checkValidMutableAry:obj];
	}
	else if ( [obj isKindOfClass:[NSString class]] )
	{
        return [NSObject checkValidNSString:obj];
	}
	else if ( [obj isKindOfClass:[NSData class]] )
	{
        
	}
    return NO;
}

+ (BOOL)checkValidAry:(NSArray *)array {
    
    BOOL valid = NO;
    
    if (!array) {
        
        return valid;
    }
    
    if (array && [array isKindOfClass:[NSArray class]] && array.count) {
        
        valid = YES;
    }
    
   return valid;
}

+ (BOOL)checkValidMutableAry:(NSMutableArray *)array {
    
    BOOL valid = NO;
    
    if (!array) {
        
        return valid;
    }
    
    if (array && [array isKindOfClass:[NSMutableArray class]] && array.count) {
        
        valid = YES;
    }
    
    return valid;
}

+ (BOOL)checkValidDictionary:(NSDictionary *)dic {
    
    BOOL valid = NO;
    
    if (!dic) {
        
        return valid;
    }
    
    if (dic && [dic isKindOfClass:[NSDictionary class]] && dic.allKeys.count && dic.allValues.count) {
        
        valid = YES;
    }
    
    return valid;
}

+ (BOOL)checkValidMutableDictionary:(NSDictionary *)dic {
    
    BOOL valid = NO;
    
    if (!dic) {
        
        return valid;
    }
    
    if (dic && [dic isKindOfClass:[NSMutableDictionary class]] && dic.allKeys.count && dic.allValues.count) {
        
        valid = YES;
    }
    
    return valid;
}

+ (BOOL)checkValidNSString:(NSString *)str {
    
    BOOL valid = NO;
    
    if (!str) {
        
        return valid;
    }
    
    if (str && [str isKindOfClass:[NSString class]] && str.length) {
        
        valid = YES;
    }
    
    return valid;
}

//单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath {
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString* fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        folderSize += [NSObject fileSizeAtPath:fileAbsolutePath];
        
    }
    
    return folderSize/(1024.0*1024.0);
}

/* 释放某些元素 */
- (void)releaseSomeElements {
    //subClass implementation this methods,if need.
}
+ (NSString *)messageStringWithCount:(int)count {
    
    NSString *resultStr = @"0";
    if (count < 0) {
        
        resultStr = @"0";
    }else if (count > 99) {
        
        resultStr = @"99+";
    }else {
        
        resultStr = [NSString stringWithFormat:@"%d",count];
    }
    
    return resultStr;
}

@end

// TODO: 0.5
