//
//  UIView+Expand.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "UIView+Expand.h"

@implementation UIView (Expand)

+(void)removeAllSubViews:(UIView *)parentView{
    for(UIView * view in [parentView subviews]){
        [view removeFromSuperview];
    }
}


- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

-(UIView *(^)(CGFloat ))setCornerRadius{
    return ^(CGFloat radius){
        self.layer.cornerRadius = radius;
        return self;
    };
}

-(void)setSetCornerRadius:(UIView * _Nonnull (^)(CGFloat))setCornerRadius{}

-(UIView* (^)(CGFloat))setBorderWidth{
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

-(void)setSetBorderWidth:(UIView * _Nonnull (^)(CGFloat))setBorderWidth{}

-(UIView* (^)(UIColor *))setBorderColor{
    return ^(UIColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

-(void)setSetBorderColor:(UIView * _Nonnull (^)(UIColor * _Nonnull))setBorderColor{}


-(UIView* (^)(NSInteger ))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}


-(void)setSetTag:(UIView * _Nonnull (^)(NSInteger))setTag{}


-(UIView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *bgColor){
        self.backgroundColor = bgColor;
        return self;
    };
}

-(void)setSetBackgroundColor:(UIView * _Nonnull (^)(UIColor * _Nonnull))setBackgroundColor{
    
}

@end
