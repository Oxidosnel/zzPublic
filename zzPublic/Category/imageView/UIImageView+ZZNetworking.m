// UIImageView+ZZNetworking.m
//
// Copyright (c) 2013-2014 AFNetworking (http://afnetworking.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIImageView+ZZNetworking.h"



#import <objc/runtime.h>

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)

#import "AFHTTPRequestOperation.h"



@interface ZZImageCache : NSCache <ZZImageCache>

@property (nonatomic, strong) NSString *localFilePath;

@end

#pragma mark -

@interface UIImageView (_ZZNetworking)
@property (readwrite, nonatomic, strong, setter = af_setImageRequestOperation:) AFHTTPRequestOperation *af_imageRequestOperation;
@property (readwrite, nonatomic, strong, setter = setCurrentRequstFileName:) NSString *currentRequstFileName;
@end

@implementation UIImageView (_ZZNetworking)

+ (NSOperationQueue *)af_sharedImageRequestOperationQueue
{
    static NSOperationQueue *_af_sharedImageRequestOperationQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _af_sharedImageRequestOperationQueue = [[NSOperationQueue alloc] init];
        _af_sharedImageRequestOperationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    });
    
    return _af_sharedImageRequestOperationQueue;
}

+ (dispatch_queue_t)af_sharedLocalImageReadOperationQueue
{
    static dispatch_queue_t localImagelrcQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localImagelrcQueue = dispatch_queue_create("com.michong.haochang.fileRead.queue", DISPATCH_QUEUE_SERIAL);
    });
    
    return localImagelrcQueue;
}

+ (dispatch_queue_t)af_sharedLocalImageWriteOperationQueue
{
    static dispatch_queue_t localImagelrcQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localImagelrcQueue = dispatch_queue_create("com.michong.haochang.fileWrite.queue", DISPATCH_QUEUE_SERIAL);
    });
    
    return localImagelrcQueue;
}


- (AFHTTPRequestOperation *)af_imageRequestOperation
{
    return (AFHTTPRequestOperation *)objc_getAssociatedObject(self, @selector(af_imageRequestOperation));
}

- (void)af_setImageRequestOperation:(AFHTTPRequestOperation *)imageRequestOperation
{
    objc_setAssociatedObject(self, @selector(af_imageRequestOperation), imageRequestOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSString *)currentRequstFileName
{
    return (NSString *)objc_getAssociatedObject(self, @selector(currentRequstFileName));
}

-(void)setCurrentRequstFileName:(NSString *)fileName
{
    objc_setAssociatedObject(self, @selector(currentRequstFileName), fileName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark -

@implementation UIImageView (ZZNetworking)
@dynamic imageResponseSerializer;

+ (id <ZZImageCache>)zzsharedImageCache {
    static ZZImageCache *_af_defaultImageCache = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _af_defaultImageCache = [[ZZImageCache alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * __unused notification) {
            [_af_defaultImageCache removeAllObjects];
        }];
    });
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
    return objc_getAssociatedObject(self, @selector(sharedImageCache)) ?: _af_defaultImageCache;
#pragma clang diagnostic pop
}

+ (void)setSharedImageCache:(id<ZZImageCache>)imageCache {
    objc_setAssociatedObject(self, @selector(sharedImageCache), imageCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id <AFURLResponseSerialization>)imageResponseSerializer {
    static id <AFURLResponseSerialization> _af_defaultImageResponseSerializer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _af_defaultImageResponseSerializer = [AFImageResponseSerializer serializer];
    });
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
    return objc_getAssociatedObject(self, @selector(imageResponseSerializer)) ?: _af_defaultImageResponseSerializer;
#pragma clang diagnostic pop
}

- (void)setImageResponseSerializer:(id <AFURLResponseSerialization>)serializer {
    objc_setAssociatedObject(self, @selector(imageResponseSerializer), serializer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)compressionQuality
{
    return objc_getAssociatedObject(self, @selector(compressionQuality));
}

-(void)setCompressionQuality:(NSNumber *)quality
{
    objc_setAssociatedObject(self, @selector(compressionQuality), quality, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -

- (void)setImageWithURL:(NSURL *)url {
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    [self setImageWithURLRequest:request placeholderImage:placeholderImage success:nil failure:nil];
}

- (void)setBlurImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage
{
    self.image = [placeholderImage boxblurImage];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    WEAKSELF;
    [self setImageWithURLRequest:urlRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        weakSelf.image = [image boxblurImage];
    } failure:nil];
}

- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure
{
    WEAKSELF;
    [self setImageWithURLRequest:urlRequest placeholderImage:placeholderImage
               successCheckCache:^(NSURLRequest *request, NSHTTPURLResponse *response, BOOL isCache, UIImage *image) {
                   if (success) {
                       success(request, response, image);
                   } else {
                       weakSelf.image = image;
                   }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        if (failure) {
            failure(request, response, error);
        }
    }];
}

- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
             successCheckCache:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, BOOL isCache, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure;
{
    [self cancelImageRequestOperation];
    
    NSString *fileName = [[[urlRequest URL] absoluteString] lastPathComponent];

    self.currentRequstFileName = fileName;
    if (fileName.length == 0) {
        self.af_imageRequestOperation = nil;
        if (placeholderImage) {
            self.image = placeholderImage;
        }
        if (failure) {
            failure(nil, nil, nil);
        }
        return;
    }
    
    //内存缓存读取
    UIImage *cachedImage = [[[self class] zzsharedImageCache] cachedImageForFileName:fileName];
    if (cachedImage) {
        if (success) {
            success(nil, nil, YES, cachedImage);
        } else {
            self.image = cachedImage;
        }
        
        self.af_imageRequestOperation = nil;
        return;
    }
    
    //文件缓存读取
    if ([[[self class] zzsharedImageCache] existLocalImageFileForFileName:fileName]) {
        
        self.af_imageRequestOperation = nil;

        dispatch_async([[UIImageView class] af_sharedLocalImageReadOperationQueue], ^{
            
            if (![self.currentRequstFileName isEqualToString:fileName]) return;
            
            UIImage *localImage = [[[self class] zzsharedImageCache] localImageFileForFileName:fileName];
            if (localImage) {
                
                [[[self class] zzsharedImageCache] cacheImage:localImage forFileName:fileName];
                
                if (success) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (![self.currentRequstFileName isEqualToString:fileName]) return;
                        success(nil, nil, YES, localImage);
                    });
                    
                } else {
                    self.image = localImage;
                }
            } else {
                if (failure) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (![self.currentRequstFileName isEqualToString:fileName]) return;
                        failure(nil, nil, nil);
                    });
                }
            }
        });
        
        return;
    }
    
    //请求网络
    if (placeholderImage) {
        self.image = placeholderImage;
    }
    
    __weak __typeof(self)weakSelf = self;
    self.af_imageRequestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    self.af_imageRequestOperation.responseSerializer = self.imageResponseSerializer;
    [self.af_imageRequestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if ([[urlRequest URL] isEqual:[operation.request URL]] && [[[operation.request URL] lastPathComponent] isEqualToString:fileName]) {
            if (success) {
                success(urlRequest, operation.response, NO, responseObject);
            } else if (responseObject) {
                strongSelf.image = responseObject;
            }
            
            if (operation == strongSelf.af_imageRequestOperation){
                strongSelf.af_imageRequestOperation = nil;
            }
        }

        [[[strongSelf class] zzsharedImageCache] cacheImage:responseObject forFileName:fileName];
        [[[strongSelf class] zzsharedImageCache] cacheLocalImage:responseObject forFileName:fileName compressionQuality:strongSelf.compressionQuality];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if ([[urlRequest URL] isEqual:[operation.request URL]] && [[[operation.request URL] lastPathComponent] isEqualToString:fileName]) {
            if (failure) {
                failure(urlRequest, operation.response, error);
            }
            
            if (operation == strongSelf.af_imageRequestOperation){
                strongSelf.af_imageRequestOperation = nil;
            }
        }
    }];
    
    [[[self class] af_sharedImageRequestOperationQueue] addOperation:self.af_imageRequestOperation];
    
}

- (void)cancelImageRequestOperation {
    [self.af_imageRequestOperation cancel];
    self.af_imageRequestOperation = nil;
}

@end

#pragma mark -


@implementation ZZImageCache

-(NSString *)localFilePath
{
    if (_localFilePath == nil) {
        _localFilePath = PathAFImageCach;
    }
    return _localFilePath;
}

- (UIImage *)cachedImageForRequest:(NSURLRequest *)urlRequest
{
    return [self cachedImageForFileName:[[[urlRequest URL] absoluteString] lastPathComponent]];
    
}

- (UIImage *)cachedImageForFileName:(NSString *)fileName
{
    return [self objectForKey:fileName];
}

- (BOOL)existLocalImageFileForFileName:(NSString *)fileName
{
    NSString *filePath = [self.localFilePath stringByAppendingPathComponent:fileName];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

- (void)cacheImage:(UIImage *)image forFileName:(NSString *)fileName
{
    if (image && fileName) {
        [self setObject:image forKey:fileName];
    }
}


- (UIImage *)localImageFileForFileName:(NSString *)fileName
{
    NSString *filePath = [self.localFilePath stringByAppendingPathComponent:fileName];
    
    NSData *imageData = [[NSData alloc] initWithContentsOfFile:filePath];
    if (imageData) {
        return [[UIImage alloc] initWithData:imageData];
    }
    
    return nil;
}


-(void)cacheLocalImage:(UIImage *)image forFileName:(NSString*)fileName compressionQuality:(NSNumber *)quality
{
    dispatch_async([[UIImageView class] af_sharedLocalImageWriteOperationQueue], ^{
    
        NSData *imageData = nil;
        if ([fileName hasSuffix:@"jpg"]) {
            if (quality) {
                imageData = UIImageJPEGRepresentation(image, [quality doubleValue]);
            } else {
                imageData = UIImageJPEGRepresentation(image, 1);
            }
        } else {
            imageData = UIImagePNGRepresentation(image);
        }
        
        NSString *savePath = [self.localFilePath stringByAppendingPathComponent:fileName];
        BOOL success = [imageData writeToFile:savePath atomically:YES];
        if (!success) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:self.localFilePath]) {
                [[NSFileManager defaultManager] createDirectoryAtPath:self.localFilePath withIntermediateDirectories:YES attributes:nil error:nil];
                [imageData writeToFile:savePath atomically:YES];
            }
        }
    });
}

@end
#endif
