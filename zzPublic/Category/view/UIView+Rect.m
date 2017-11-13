//
//  UIView+Rect.m
//  haochang
//
//  Created by Administrator on 14-7-22.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import "UIView+Rect.h"

@implementation UIView (Rect)

@dynamic sizeHeight, sizeWidth, originX, originY;
@dynamic minX, midX, maxX;
@dynamic minY, midY, maxY;

-(CGFloat)sizeHeight
{
    return self.frame.size.height;
}

-(void)setSizeHeight:(CGFloat)sizeHeight
{
    CGRect frame = self.frame;
    frame.size.height = sizeHeight;
    
    self.frame = frame;
}

-(CGFloat)sizeWidth
{
    return self.frame.size.width;
}

-(void)setSizeWidth:(CGFloat)sizeWidth
{
    CGRect frame = self.frame;
    frame.size.width = sizeWidth;
    
    self.frame = frame;
}

-(CGFloat)originX
{
    return self.frame.origin.x;
}

-(void)setOriginX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    
    self.frame = frame;
}

-(CGFloat)originY
{
    return self.frame.origin.y;
}

-(void)setOriginY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    
    self.frame = frame;
}

-(CGFloat)minX
{
    return CGRectGetMinX(self.frame);
}

-(CGFloat)midX
{
    return CGRectGetMidX(self.frame);
}

-(CGFloat)maxX
{

    return CGRectGetMaxX(self.frame);
}

-(CGFloat)minY
{
    return CGRectGetMinY(self.frame);
}

-(CGFloat)midY
{
    return CGRectGetMidY(self.frame);
}

-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

@end
