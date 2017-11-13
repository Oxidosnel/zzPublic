//
//  UIView+Rect.h
//  haochang
//
//  Created by Administrator on 14-7-22.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rect)


@property (nonatomic, assign, readwrite) CGFloat sizeHeight;
@property (nonatomic, assign, readwrite) CGFloat sizeWidth;

@property (nonatomic, assign, readwrite) CGFloat originX;
@property (nonatomic, assign, readwrite) CGFloat originY;

@property (nonatomic, assign, readonly) CGFloat minX;
@property (nonatomic, assign, readonly) CGFloat midX;
@property (nonatomic, assign, readonly) CGFloat maxX;

@property (nonatomic, assign, readonly) CGFloat minY;
@property (nonatomic, assign, readonly) CGFloat midY;
@property (nonatomic, assign, readonly) CGFloat maxY;


@end
